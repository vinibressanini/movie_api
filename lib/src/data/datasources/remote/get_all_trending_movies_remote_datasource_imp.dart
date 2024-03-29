import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../env/env.dart';
import '../../../domain/entitites/movie_entity.dart';
import '../../dtos/movie_dto.dart';
import '../get_all_trending_movies_datasource.dart';

class GetAllTrendingMoviesRemoteDatasourceImp
    implements GetAllTrendingMoviesDatasource {
  final Dio _dio;
  GetAllTrendingMoviesRemoteDatasourceImp(this._dio);

  @override
  Future<List<MovieEntity>> getAllTrendingMovies(
      String timeWindow, int page) async {
    List<MovieEntity> movies = [];

    try {
      final response =
          await _dio.get("trending/movie/$timeWindow", queryParameters: {
        'api_key': Env.tmdbApiKey,
        'page': page,
      });

      movies = List.from(
          response.data['results'].map((movie) => MovieDto.fromMap(movie)));
    } catch (e) {
      debugPrint(e.toString());
    }

    return movies;
  }
}
