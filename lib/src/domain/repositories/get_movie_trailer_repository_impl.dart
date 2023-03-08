import 'package:all_in_one/src/data/repositories/get_movie_trailer_repository.dart';
import 'package:all_in_one/src/domain/entitites/movie_trailer_entity.dart';

import '../../data/datasources/get_movie_trailer_datasource.dart';

class GetMovieTrailerRepositoryImpl implements GetMovieTrailerRepository {
  final GetMovieTrailerDatasource _datasource;

  GetMovieTrailerRepositoryImpl(this._datasource);

  @override
  Future<MovieTrailerEntity> getMovieTrailer(int movieId) async {
    return await _datasource.getMovieTrailer(movieId);
  }
}
