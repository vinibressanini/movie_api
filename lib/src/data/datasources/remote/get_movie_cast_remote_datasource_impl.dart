import 'package:all_in_one/env/env.dart';
import 'package:all_in_one/src/data/datasources/get_movie_cast_datasource.dart';
import 'package:all_in_one/src/data/dtos/actor_dto.dart';
import 'package:all_in_one/src/domain/entitites/actor_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetMovieCastRemoteDatasourceImpl implements GetMovieCastDatasource {
  final Dio _dio;

  GetMovieCastRemoteDatasourceImpl(this._dio);

  @override
  Future<List<ActorEntity>> getMovieCast(int movieId) async {
    List<ActorEntity> actors = [];

    try {
      var response = await _dio.get(
        '${Env.tmdbBaseUrl}movie/$movieId/credits',
        queryParameters: {'api_key': Env.tmdbApiKey},
      );

      actors = List.from(
          response.data['cast'].map((actor) => ActorDto.fromMap(actor)));
    } catch (e) {
      debugPrint(e.toString());
    }

    return actors;
  }
}
