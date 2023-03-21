import 'package:all_in_one/src/domain/entitites/actor_entity.dart';

abstract class GetMovieCastUsecase {
  Future<List<ActorEntity>> getMovieCast(int movieId);
}
