import 'package:all_in_one/env/env.dart';
import 'package:all_in_one/src/data/datasources/get_watch_providers_datasource.dart';
import 'package:all_in_one/src/data/dtos/watch_provider_dto.dart';
import 'package:all_in_one/src/domain/entitites/watch_provider_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GetWatchProvidersRemoteDatasourceImpl
    implements GetWatchProvidersDatasource {
  final Dio _dio;

  GetWatchProvidersRemoteDatasourceImpl(this._dio);

  @override
  Future<List<WatchProviderEntity>> getWatchProviders(int movieId) async {
    List<WatchProviderEntity> providers = [];

    try {
      var response = await _dio.get(
        '${Env.tmdbBaseUrl}movie/$movieId/watch/providers',
        queryParameters: {'api_key': Env.tmdbApiKey},
      );

      providers = List.from(response.data['results']['BR']['flatrate']
          .map((provider) => WatchProviderDto.fromMap(provider)));
    } catch (e) {
      debugPrint(e.toString());
    }

    return providers;
  }
}
