import '../../domain/entitites/movie_video_entity.dart';

abstract class GetMovieTrailerDatasource {
  Future<List<MovieVideoEntity>> getMovieTrailer(int movieId);
}
