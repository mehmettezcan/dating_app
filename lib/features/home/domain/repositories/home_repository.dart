import 'package:dating_app/features/home/data/models/movie.dart';

abstract class HomeRepository {
  Future<List<MovieModel>> fetchMovies({required int page});
  Future<void> toggleFavorite(String movieId);
  Future<List<MovieModel?>> fetchFavorites();
}
