import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../data/datasources/remote/get_all_trending_movies_remote_datasource_imp.dart';
import '../../../domain/entitites/movie_entity.dart';
import '../../../domain/repositories/get_all_trending_movies_repository_imp.dart';
import '../../../domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase_imp.dart';
import 'movies_notifier.dart';

final dioProvider = Provider(((ref) => Dio()));

final moviesDatasouceProvider = Provider<GetAllTrendingMoviesRemoteDatasourceImp>( (ref) {
  return GetAllTrendingMoviesRemoteDatasourceImp(ref.watch(dioProvider));
});

final moviesRepositoryProvider = Provider<GetAllTrendingMoviesRepositoryImp>( (ref) {
  return GetAllTrendingMoviesRepositoryImp(ref.watch(moviesDatasouceProvider));
});

final moviesUsecaseProvider = Provider<GetAllTrendingMoviesUsecaseImp>( (ref) {
  return GetAllTrendingMoviesUsecaseImp(ref.watch(moviesRepositoryProvider));
});

final moviesNotifierProvider = StateNotifierProvider<MoviesNotifier,List<MovieEntity>>(
  ((ref) => MoviesNotifier(ref.watch(moviesUsecaseProvider))),
);
