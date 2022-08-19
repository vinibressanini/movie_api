import '../../domain/entitites/movie_entity.dart';

abstract class GetAllTrendingMoviesRepository {
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow);
}
