import 'package:all_in_one/src/domain/entitites/movie_entity.dart';

abstract class GetAllTrendingMoviesUsecase {
  Future<List<MovieEntity>> getAllTrendingMovies (String timeWindow);
}
