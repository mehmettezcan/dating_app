import 'package:dating_app/core/generated/l10n.dart';
import 'package:dating_app/core/utils/widgets/bottom_nav_bar.dart';
import 'package:dating_app/core/utils/widgets/button.dart';
import 'package:dating_app/features/home/data/models/movie.dart';
import 'package:dating_app/features/profile/data/models/profile_model.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_state.dart';
import 'package:dating_app/features/profile/presentation/widgets/limited_offer_bottom_sheet.dart';
import 'package:dating_app/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 16),

              // AppBar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteGenerator.homeScreen,
                        (route) => false,
                      );
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Text(
                    S.of(context).profileDetail,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => showLimitedOfferBottomSheet(context),
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                size: 16,
                                color: Colors.white,
                              ),
                              SizedBox(width: 4),
                              Text(
                                S.of(context).limitedOffer,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),
              BlocProvider.of<ProfileBloc>(context).state is! ProfileSuccess
                  ? BlocBuilder<ProfileBloc, ProfileState>(
                    builder: (context, state) {
                      if (state is ProfileInitial) {
                        context.read<ProfileBloc>().add(GetProfileEvent());
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProfileLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is ProfileSuccess) {
                        final ProfileModel profile = state.profile;
                        final List<MovieModel?> favorites = state.favorites;

                        return Column(
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundColor: Colors.grey[800],
                                  backgroundImage: NetworkImage(
                                    profile.photoUrl,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        profile.name,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              "ID: ${profile.id}",
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 12),
                                Expanded(
                                  child: AppButton(
                                    text: S.of(context).uploadPhoto,
                                    onPressed: () {
                                      Navigator.pushNamed(
                                        context,
                                        RouteGenerator.uploadPhotoScreen,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  S.of(context).likedMovies,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),

                            GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              mainAxisSpacing: 12,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              childAspectRatio: 0.75,
                              children:
                                  favorites.map((movie) {
                                    if (movie == null)
                                      return const SizedBox.shrink();

                                    return _FilmItem(
                                      image: movie.images.first,
                                      title: movie.title,
                                      subtitle: movie.genre,
                                    );
                                  }).toList(),
                            ),
                          ],
                        );
                      } else if (state is ProfileFailure) {
                        return Center(child: Text("Hata: ${state.message}"));
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class _FilmItem extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const _FilmItem({
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            image,
            fit: BoxFit.fitHeight,
            width: double.infinity,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          subtitle,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
