import 'package:all_in_one/src/data/dtos/movie_trailer_dto.dart';

import '../get_movie_trailer_datasource.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../domain/entitites/movie_video_entity.dart';

class GetMovieTrailerRemoteDatasourceImpl implements GetMovieTrailerDatasource {
  final Dio _dio;

  GetMovieTrailerRemoteDatasourceImpl(this._dio);

  @override
  Future<List<MovieVideoEntity>> getMovieTrailer(int movieId) async {
    List<MovieVideoEntity> videos = [];

    try {
      final response = await _dio.get(
          'https://api.themoviedb.org/3/movie/$movieId/videos',
          queryParameters: {
            'api_key': 'b10fbc8ab6f0664504a360887c8e34b8',
            'language': 'pt-BR'
          });

      videos = List.from(
          response.data['results'].map((movie) => MovieTrailerDto.fromMap(movie)));
    } catch (e) {
      debugPrint(e.toString());
    }
    return videos;
  }
}
