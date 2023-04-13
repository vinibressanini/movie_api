import '../../domain/entitites/movie_entity.dart';

abstract class GetAllTrendingMoviesDatasource {
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow, int page);
}
