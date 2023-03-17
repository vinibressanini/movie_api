import 'dart:async';

import 'package:all_in_one/src/data/datasources/get_all_trending_movies_datasource.dart';
import 'package:all_in_one/src/data/dtos/movie_dto.dart';
import 'package:all_in_one/src/domain/entitites/movie_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../env/env.dart';

class GetAllTrendingMoviesRemoteDatasourceImp
    implements GetAllTrendingMoviesDatasource {
  final Dio _dio;
  GetAllTrendingMoviesRemoteDatasourceImp(this._dio);

  @override
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow) async {
    List<MovieEntity> movies = [];

    try {
      final response = await _dio.get(
          "https://api.themoviedb.org/3/trending/movie/$timeWindow",
          queryParameters: {'api_key': Env.tmdbApiKey});

      movies = List.from(
          response.data['results'].map((movie) => MovieDto.fromMap(movie)));
    } catch (e) {
      debugPrint(e.toString());
    }

    return movies;
  }
}
