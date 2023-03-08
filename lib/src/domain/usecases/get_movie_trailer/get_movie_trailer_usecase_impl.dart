import 'package:all_in_one/src/domain/entitites/movie_trailer_entity.dart';
import 'package:all_in_one/src/domain/usecases/get_movie_trailer/get_movie_trailer_usecase.dart';

import '../../../data/repositories/get_movie_trailer_repository.dart';

class GetMovieTrailerUsecaseImpl implements GetMovieTrailerUsecase {
  final GetMovieTrailerRepository _repository;

  GetMovieTrailerUsecaseImpl(this._repository);

  @override
  Future<MovieTrailerEntity> getMovieTrailer(int movieId) async {
    return await _repository.getMovieTrailer(movieId);
  }
}
