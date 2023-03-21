import 'package:all_in_one/src/domain/entitites/actor_entity.dart';

abstract class GetMovieCastRepository {
  Future<List<ActorEntity>> getMovieCast(int movieId);
}
