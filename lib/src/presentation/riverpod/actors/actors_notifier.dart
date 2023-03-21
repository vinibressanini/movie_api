import 'package:all_in_one/src/domain/usecases/get_movie_cast/get_movie_cast_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entitites/actor_entity.dart';

class ActorsNotifier extends StateNotifier<List<ActorEntity>> {
  final GetMovieCastUsecase _usecase;

  ActorsNotifier(this._usecase) : super([]);

  Future<void> getMovieCast(int movieId) async {
    state = await _usecase.getMovieCast(movieId);
  }
}
