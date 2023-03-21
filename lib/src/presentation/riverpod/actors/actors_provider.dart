import 'package:all_in_one/src/data/datasources/remote/get_movie_cast_remote_datasource_impl.dart';
import 'package:all_in_one/src/domain/entitites/actor_entity.dart';
import 'package:all_in_one/src/domain/repositories/get_movie_cast_repository_impl.dart';
import 'package:all_in_one/src/domain/usecases/get_movie_cast/get_movie_cast_usecase_impl.dart';
import 'package:all_in_one/src/presentation/riverpod/actors/actors_notifier.dart';
import 'package:all_in_one/src/presentation/riverpod/movies/movies_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final actorsDatasourceProvider = Provider<GetMovieCastRemoteDatasourceImpl>(
    (ref) => GetMovieCastRemoteDatasourceImpl(ref.watch(dioProvider)));

final actorsRepositoryProvider = Provider<GetMovieCastRepositoryImpl>(
    (ref) => GetMovieCastRepositoryImpl(ref.watch(actorsDatasourceProvider)));

final actorsUsecaseProvider = Provider<GetMovieCastUsecaseImpl>(
    (ref) => GetMovieCastUsecaseImpl(ref.watch(actorsRepositoryProvider)));

final actorsNotifierProvider = StateNotifierProvider<ActorsNotifier,List<ActorEntity>>((ref) {
  return ActorsNotifier(ref.watch(actorsUsecaseProvider));
});
