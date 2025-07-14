import 'package:dating_app/features/home/data/datasources/home_remote_datasources.dart';
import 'package:dating_app/features/home/data/models/movie.dart';
import 'package:loggy/loggy.dart';

import 'home_repository.dart';

class HomeRepositoryImpl with UiLoggy implements HomeRepository {
  final HomeRemoteDatasources remote;

  HomeRepositoryImpl(this.remote);

  @override
  Future<List<MovieModel>> fetchMovies({required int page}) async {
    try {
      final movies = await remote.getMovies(page: page);
      logInfo('Fetched ${movies.length} movies from remote data source');
      return movies;
    } catch (e) {
      logError('Failed to fetch movies: $e');
      throw Exception('Failed to fetch movies');
    }
  }

  @override
  Future<void> toggleFavorite(String movieId) async {
    try {
      await remote.toggleFavorite(movieId);
      logInfo('Toggled favorite for movie ID: $movieId');
    } catch (e) {
      logError('Failed to toggle favorite for movie ID $movieId: $e');
      throw Exception('Failed to toggle favorite');
    }
  }

  @override
  Future<List<MovieModel?>> fetchFavorites() async {
    try {
      final favorites = await remote.fetchFavorites();
      logInfo('Fetched $favorites favorite movies from remote data source');
      return favorites;
    } catch (e) {
      logError('Failed to fetch favorites: $e');
      throw Exception('Failed to fetch favorites');
    }
  }
}
