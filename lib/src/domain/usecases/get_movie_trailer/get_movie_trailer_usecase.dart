
import 'package:all_in_one/src/domain/entitites/movie_video_entity.dart';

abstract class GetMovieTrailerUsecase {
  Future<List<MovieVideoEntity>> getMovieTrailer (int movieId);
}