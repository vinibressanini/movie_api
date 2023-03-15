import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:all_in_one/src/domain/entitites/movie_details_entity.dart';

import '../../../domain/usecases/get_movie_details/get_movie_details_usecase.dart';

class MovieDetailsNotifier extends StateNotifier<MovieDetailsEntity> {
  final GetMovieDetailsUsecase _usecase;

  MovieDetailsNotifier(
    this._usecase,
  ) : super(MovieDetailsEntity(
          budget: 0,
          genres: [],
          releaseDate: "",
          revenue: 0,
          runtime: 0,
          tagline: "",
        ));

  Future<void> getMovieDetails(int movieId) async {
    state = await _usecase.getMovieDetails(movieId);
  }
}
