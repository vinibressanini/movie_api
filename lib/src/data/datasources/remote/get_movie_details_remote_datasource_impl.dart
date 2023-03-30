import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../../../env/env.dart';
import '../../../domain/entitites/movie_details_entity.dart';
import '../../dtos/movie_details_dto.dart';
import '../get_movie_details_datasource.dart';

class GetMovieDetailsRemoteDatasourceImpl implements GetMovieDetailsDatasource {
  final Dio _dio;

  GetMovieDetailsRemoteDatasourceImpl(this._dio);

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    late final MovieDetailsEntity details;
    try {
      var response = await _dio.get(
        "movie/$movieId",
        queryParameters: {
          "api_key": Env.tmdbApiKey,
          "language": "pt-BR",
        },
      );
      details = MovieDetailsDto.fromMap(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
    return details;
  }
}
