import 'package:dating_app/features/home/data/models/movie.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}

class HomeRefreshing extends HomeState {}

class HomeLoaded extends HomeState {
  final List<MovieModel> movies;

  HomeLoaded({required this.movies});

  HomeLoaded copyWith({List<MovieModel>? movies}) {
    return HomeLoaded(movies: movies ?? this.movies);
  }
}
