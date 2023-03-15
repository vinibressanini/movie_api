import 'dart:async';

import '../../data/datasources/get_movie_details_datasource.dart';
import '../../data/repositories/get_movie_details_repository.dart';
import '../entitites/movie_details_entity.dart';

class GetMovieDetailsRepositoryImpl extends GetMovieDetailsRepository {
  final GetMovieDetailsDatasource _datasource;

  GetMovieDetailsRepositoryImpl(this._datasource);

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    return await _datasource.getMovieDetails(movieId);
  }
}
