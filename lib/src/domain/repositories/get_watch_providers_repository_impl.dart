import 'package:all_in_one/src/data/repositories/get_watch_providers_repository.dart';
import 'package:all_in_one/src/domain/entitites/watch_provider_entity.dart';

import '../../data/datasources/get_watch_providers_datasource.dart';

class GetWatchProvidersRepositoryImpl implements GetWatchProvidersRepository{

  final GetWatchProvidersDatasource _datasource;

  GetWatchProvidersRepositoryImpl(this._datasource);

  @override
  Future<List<WatchProviderEntity>> getWatchProviders(int movieId) async {
    return await _datasource.getWatchProviders(movieId);
  }
  
}