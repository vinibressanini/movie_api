import 'package:all_in_one/src/domain/entitites/movie_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase.dart';

class MoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final GetAllTrendingMoviesUsecase _usecase;
  int _page = 1;

  MoviesNotifier(this._usecase) : super([]) {
    getAllTrendingMovies('day');
  }

  Future<void> getAllTrendingMoviesPageable(String timeWindow) async {

    var moviesList = await _usecase.getAllTrendingMovies(timeWindow, _page);
    state = [...state, ...moviesList];
    _page++;
  }

  Future<void> getAllTrendingMovies(String timeWindow) async {
    _page = 1;
    var moviesList = await _usecase.getAllTrendingMovies(timeWindow, _page);
    state = [];
    await Future.delayed(const Duration(seconds: 1));
    state = [...moviesList];
    _page++;
  }
}
