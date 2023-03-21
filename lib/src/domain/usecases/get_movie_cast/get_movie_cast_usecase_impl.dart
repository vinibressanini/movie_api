import 'package:all_in_one/src/domain/entitites/actor_entity.dart';
import 'package:all_in_one/src/domain/usecases/get_movie_cast/get_movie_cast_usecase.dart';

import '../../../data/repositories/get_movie_cast_repository.dart';

class GetMovieCastUsecaseImpl implements GetMovieCastUsecase {
  final GetMovieCastRepository _repository;

  GetMovieCastUsecaseImpl(this._repository);

  @override
  Future<List<ActorEntity>> getMovieCast(int movieId) async {
    return await _repository.getMovieCast(movieId);
  }
}
