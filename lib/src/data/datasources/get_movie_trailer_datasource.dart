import '../../domain/entitites/movie_trailer_entity.dart';

abstract class GetMovieTrailerDatasource {
  Future<MovieTrailerEntity> getMovieTrailer(int movieId);
}
