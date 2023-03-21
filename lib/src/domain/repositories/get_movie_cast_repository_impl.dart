import 'package:all_in_one/src/data/repositories/get_movie_cast_repository.dart';
import 'package:all_in_one/src/domain/entitites/actor_entity.dart';

import '../../data/datasources/get_movie_cast_datasource.dart';

class GetMovieCastRepositoryImpl implements GetMovieCastRepository {
  final GetMovieCastDatasource _datasource;

  GetMovieCastRepositoryImpl(this._datasource);

  @override
  Future<List<ActorEntity>> getMovieCast(int movieId) async {
    return await _datasource.getMovieCast(movieId);
  }
}
