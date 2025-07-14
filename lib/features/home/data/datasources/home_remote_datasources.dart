import 'package:dating_app/features/home/data/models/movie.dart';
import 'package:dio/dio.dart';
import 'package:loggy/loggy.dart';

class HomeRemoteDatasources with UiLoggy {
  final Dio dio;

  HomeRemoteDatasources(this.dio);

  Future<List<MovieModel>> getMovies({required int page}) async {
    final response = await dio.get(
      '/movie/list',
      queryParameters: {'page': page},
    );

    loggy.info("Filmler alındı...");
    if (response.data['data'] == null) {
      return [];
    }

    if (response.data['data']['movies'] == null) {
      return [];
    }

    return (response.data['data']['movies'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();
  }

  Future<void> toggleFavorite(String movieId) async {
    await dio.post('/movie/favorite/$movieId', data: {});
  }

  Future<List<MovieModel>> fetchFavorites() async {
    final response = await dio.get('/movie/favorites');
    loggy.info("Favoriler alındı...");

    final data = response.data['data'];
    if (data == null || data.isEmpty) return [];

    return (data as List).map((e) => MovieModel.fromJson(e)).toList();
  }
}
