
import 'package:all_in_one/src/domain/entitites/watch_provider_entity.dart';
import 'package:all_in_one/src/domain/usecases/get_watch_providers/get_watch_providers_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WatchProvidersNotifier extends StateNotifier<List<WatchProviderEntity>> {
  
  final GetWatchProvidersUsecase _usecase;

  WatchProvidersNotifier(this._usecase) : super([]);

  Future<void> getWatchProviders(int movieId) async {
    state = await _usecase.getWatchProviders(movieId);
  }

}