import 'package:all_in_one/src/domain/entitites/movie_details_entity.dart';
import 'package:all_in_one/src/domain/usecases/get_movie_details/get_movie_details_usecase.dart';

import '../../../data/repositories/get_movie_details_repository.dart';

class GetMovieDetailsUsecaseImpl extends GetMovieDetailsUsecase {
  final GetMovieDetailsRepository _repository;

  GetMovieDetailsUsecaseImpl(this._repository);

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    return await _repository.getMovieDetails(movieId);
  }
}
