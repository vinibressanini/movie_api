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

  bool calculateProfit() {
    int result = state.revenue - state.budget;

    if (result > 0) {
      return true;
    }

    return false;
  }

  String retriveMoviesGenres() {
    StringBuffer genresString = StringBuffer();

    for (String genre in state.genres) {
      if (genre == state.genres.last) {
        genresString.write(genre);
      } else {
        genresString.write('$genre, ');
      }
    }

    return genresString.toString();
  }
}
