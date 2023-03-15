import 'package:all_in_one/src/data/datasources/remote/get_movie_details_remote_datasource_impl.dart';
import 'package:all_in_one/src/domain/entitites/movie_details_entity.dart';
import 'package:all_in_one/src/domain/repositories/get_movie_details_repository_impl.dart';
import 'package:all_in_one/src/domain/usecases/get_movie_details/get_movie_details_usecase_impl.dart';
import 'package:all_in_one/src/presentation/riverpod/details/movie_details_notifier.dart';
import 'package:all_in_one/src/presentation/riverpod/movies/movies_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final movieDetailsDatasourceProvider =
    Provider<GetMovieDetailsRemoteDatasourceImpl>((ref) {
  return GetMovieDetailsRemoteDatasourceImpl(ref.watch(dioProvider));
});

final movieDetailsRepositoryProvider =
    Provider<GetMovieDetailsRepositoryImpl>((ref) {
  return GetMovieDetailsRepositoryImpl(
      ref.watch(movieDetailsDatasourceProvider));
});

final movieDetailsUsecaseProvider = Provider<GetMovieDetailsUsecaseImpl>((ref) {
  return GetMovieDetailsUsecaseImpl(ref.watch(movieDetailsRepositoryProvider));
});

final movieDetaisNotifierProvider =
    StateNotifierProvider<MovieDetailsNotifier, MovieDetailsEntity>((ref) {
  return MovieDetailsNotifier(ref.watch(movieDetailsUsecaseProvider));
});
