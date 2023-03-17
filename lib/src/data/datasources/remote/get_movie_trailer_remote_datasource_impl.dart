import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../env/env.dart';
import '../../../domain/entitites/movie_trailer_entity.dart';
import '../../dtos/movie_trailer_dto.dart';
import '../get_movie_trailer_datasource.dart';

class GetMovieTrailerRemoteDatasourceImpl implements GetMovieTrailerDatasource {
  final Dio _dio;

  GetMovieTrailerRemoteDatasourceImpl(this._dio);

  @override
  Future<MovieTrailerEntity> getMovieTrailer(int movieId) async {
    late MovieTrailerEntity videos;

    try {
      final response = await _dio.get(
          '${Env.tmdbBaseUrl}movie/$movieId/videos',
          queryParameters: {'api_key': Env.tmdbApiKey, 'language': 'pt-BR'});

      videos = MovieTrailerDto.fromMap(response.data);
    } catch (e) {
      debugPrint(e.toString());
    }
    return videos;
  }
}
