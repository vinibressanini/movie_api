
import 'package:all_in_one/src/domain/entitites/watch_provider_entity.dart';

abstract class GetWatchProvidersRepository {
  Future<List<WatchProviderEntity>> getWatchProviders(int movieId);
}