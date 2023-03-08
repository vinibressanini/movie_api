import 'package:all_in_one/src/domain/entitites/movie_trailer_entity.dart';

abstract class GetMovieTrailerRepository {
  Future<MovieTrailerEntity> getMovieTrailer(int movieId);
}
