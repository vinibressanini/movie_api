
import 'package:all_in_one/src/domain/entitites/watch_provider_entity.dart';

import '../../../data/repositories/get_watch_providers_repository.dart';
import 'get_watch_providers_usecase.dart';

class GetWatchProvidersUsecaseImpl implements GetWatchProvidersUsecase {

  final GetWatchProvidersRepository _repository;

  GetWatchProvidersUsecaseImpl(this._repository);

  @override
  Future<List<WatchProviderEntity>> getWatchProviders(int movieId) async {
    return await _repository.getWatchProviders(movieId);
  }
  
}