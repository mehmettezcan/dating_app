import 'package:dating_app/features/home/domain/repositories/home_repository.dart';
import 'package:dating_app/features/home/presentation/bloc/home_event.dart';
import 'package:dating_app/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(HomeInitial()) {
    on<FetchMovies>(_onFetchMovies);
    on<RefreshMovies>(_onRefreshMovies);
    on<ToggleFavorite>(_onToggleFavorite);
  }

  Future<void> _onFetchMovies(
    FetchMovies event,
    Emitter<HomeState> emit,
  ) async {
    try {
      final currentState = state;

      if (currentState is HomeLoading) return;

      if (event.page == 1) {
        emit(HomeLoading());
      }

      final newMovies = await repository.fetchMovies(page: event.page);

      if (currentState is HomeLoaded && event.page != 1) {
        // Önceki filmleri koruyarak yenilerini ekle
        final allMovies = List.of(currentState.movies)..addAll(newMovies);
        emit(currentState.copyWith(movies: allMovies));
      } else {
        emit(HomeLoaded(movies: newMovies));
      }
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onRefreshMovies(
    RefreshMovies event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(HomeRefreshing());
      final movies = await repository.fetchMovies(page: 1);
      emit(HomeLoaded(movies: movies));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onToggleFavorite(
    ToggleFavorite event,
    Emitter<HomeState> emit,
  ) async {
    if (state is! HomeLoaded) return;
    final currentState = state as HomeLoaded;
    // Favori durumunu güncelle
    if (event.movie.isFavorite) {
      event.movie.isFavorite = false;
    } else {
      event.movie.isFavorite = true;
    }

    final updatedMovies =
        currentState.movies.map((m) {
          return m.id == event.movie.id ? event.movie : m;
        }).toList();

    emit(currentState.copyWith(movies: updatedMovies));

    try {
      await repository.toggleFavorite(event.movie.id);
    } catch (e) {
      // Hata durumunda eski favori listesini geri yükle
      if (event.movie.isFavorite) {
        event.movie.isFavorite = true;
      } else {
        event.movie.isFavorite = false;
      }

      final revertedMovies =
          updatedMovies.map((m) {
            return m.id == event.movie.id ? event.movie : m;
          }).toList();

      emit(currentState.copyWith(movies: revertedMovies));
    }
  }
}
