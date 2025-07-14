import 'package:dating_app/core/utils/widgets/bottom_nav_bar.dart';
import 'package:dating_app/features/home/presentation/bloc/expandable_bloc.dart';
import 'package:dating_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:dating_app/features/home/presentation/bloc/home_event.dart';
import 'package:dating_app/features/home/presentation/bloc/home_state.dart';
import 'package:dating_app/features/home/presentation/widgets/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _scrollController = PageController();
  int _pageIndex = 1;
  bool _isFetching = false;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    final homeBloc = context.read<HomeBloc>();

    int pageIndex = 1;

    homeBloc.add(FetchMovies(page: pageIndex));

    _scrollController.addListener(() {
      final currentPage = _scrollController.page?.round() ?? 0;
      final loadedMoviesCount =
          (context.read<HomeBloc>().state as HomeLoaded?)?.movies.length ?? 0;

      if (!_isFetching && currentPage >= loadedMoviesCount - 2) {
        _isFetching = true;
        _pageIndex++;

        context.read<HomeBloc>().add(FetchMovies(page: _pageIndex));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ExpandedPlotCubit(),
      child: Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        body: RefreshIndicator(
          onRefresh: () async => context.read<HomeBloc>().add(RefreshMovies()),
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeLoaded) {
                _isFetching = false;
              }

              if (state is HomeError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }

              if (state is HomeRefreshing) {
                _isFetching = true;
                _pageIndex = 1;
              }

              if (state is HomeLoading) {
                _isFetching = true;
              }

              if (state is HomeInitial) {
                _isFetching = false;
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeError) {
                  return Center(child: Text(state.message));
                } else if (state is HomeLoaded) {
                  return PageView.builder(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    itemCount: state.movies.length,
                    itemBuilder: (context, index) {
                      final movie = state.movies[index];
                      final isFavorite = movie.isFavorite;

                      return Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.network(
                            movie.poster,
                            fit: BoxFit.fitWidth,
                            errorBuilder:
                                (context, error, stackTrace) => const Center(
                                  child: Icon(
                                    Icons.error,
                                    color: Colors.red,
                                    size: 48,
                                  ),
                                ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.center,
                                colors: [Colors.black, Colors.transparent],
                              ),
                            ),
                          ),

                          Positioned(
                            left: 16,
                            right: 16,
                            bottom: 12,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        border: Border.all(
                                          color: Colors.grey,
                                          width: 0.5,
                                        ),
                                        borderRadius: BorderRadius.circular(32),
                                      ),
                                      child: IconButton(
                                        onPressed: () {
                                          context.read<HomeBloc>().add(
                                            ToggleFavorite(movie),
                                          );
                                        },
                                        icon: Icon(
                                          isFavorite
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: Colors.white,
                                          size: 26,
                                        ),
                                        style: IconButton.styleFrom(
                                          backgroundColor: Colors.black38,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    const CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.movie,
                                        color: Colors.red,
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title,
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          BlocBuilder<
                                            ExpandedPlotCubit,
                                            Set<int>
                                          >(
                                            builder: (context, expandedSet) {
                                              final isExpanded = expandedSet
                                                  .contains(index);

                                              return ExpandableText(
                                                text: movie.plot,
                                                isExpanded: isExpanded,
                                                onToggle: () {
                                                  context
                                                      .read<ExpandedPlotCubit>()
                                                      .toggle(index);
                                                },
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      ),
    );
  }
}
