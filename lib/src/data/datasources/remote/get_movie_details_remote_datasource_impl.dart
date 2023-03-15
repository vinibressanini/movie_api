import 'package:all_in_one/src/data/datasources/get_movie_details_datasource.dart';
import 'package:all_in_one/src/domain/entitites/movie_details_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../dtos/movie_details_dto.dart';

class GetMovieDetailsRemoteDatasourceImpl implements GetMovieDetailsDatasource {
  final Dio _dio;

  GetMovieDetailsRemoteDatasourceImpl(this._dio);

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    late final MovieDetailsEntity details;
    try {
      var response = await _dio.get(
        "https://api.themoviedb.org/3/movie/$movieId",
        queryParameters: {
          "api_key": "b10fbc8ab6f0664504a360887c8e34b8",
          "language": "pt_BR",
        },
      );
      details = MovieDetailsDto.fromMap(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
    return details;
  }
}
