import 'package:all_in_one/src/data/datasources/remote/get_movie_trailer_remote_datasource_impl.dart';
import 'package:all_in_one/src/domain/entitites/movie_video_entity.dart';
import 'package:all_in_one/src/domain/repositories/get_movie_trailer_repository_impl.dart';
import 'package:all_in_one/src/domain/usecases/get_movie_trailer/get_movie_trailer_usecase_impl.dart';
import 'package:all_in_one/src/presentation/riverpod/movies/movies_provider.dart';
import 'package:all_in_one/src/presentation/riverpod/trailers/trailer_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final trailerDatasourceProvider =
    Provider<GetMovieTrailerRemoteDatasourceImpl>((ref) {
  return GetMovieTrailerRemoteDatasourceImpl(ref.watch(dioProvider));
});

final trailerRepositoryProvider =
    Provider<GetMovieTrailerRepositoryImpl>((ref) {
  return GetMovieTrailerRepositoryImpl(ref.watch(trailerDatasourceProvider));
});

final trailerUsecaseProvider = Provider<GetMovieTrailerUsecaseImpl>((ref) {
  return GetMovieTrailerUsecaseImpl(ref.watch(trailerRepositoryProvider));
});

final trailerNotifierProvider =
    StateNotifierProvider<TrailerNotifier, List<MovieVideoEntity>>(
        (ref) => TrailerNotifier(ref.watch(trailerUsecaseProvider)));
