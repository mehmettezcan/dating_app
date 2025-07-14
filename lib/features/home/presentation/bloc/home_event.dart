import 'package:dating_app/features/home/data/models/movie.dart';

abstract class HomeEvent {}

class FetchMovies extends HomeEvent {
  final int page;

  FetchMovies({this.page = 1});
}

class RefreshMovies extends HomeEvent {}

class ToggleFavorite extends HomeEvent {
  final MovieModel movie;

  ToggleFavorite(this.movie);
}
