
import 'package:all_in_one/src/domain/entitites/movie_details_entity.dart';

abstract class GetMovieDetailsUsecase {
  Future<MovieDetailsEntity> getMovieDetails(int movieId);
}