import 'package:all_in_one/src/domain/entitites/movie_video_entity.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/usecases/get_movie_trailer/get_movie_trailer_usecase.dart';

class TrailerNotifier extends StateNotifier<List<MovieVideoEntity>> {
  final GetMovieTrailerUsecase _usecase;

  TrailerNotifier(this._usecase) : super([]);

  Future<void> getMovieTrailer(int movieId) async {
    state = await _usecase.getMovieTrailer(movieId);
  }
}
