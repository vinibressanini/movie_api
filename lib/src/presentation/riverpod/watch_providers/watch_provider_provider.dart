import 'package:all_in_one/src/data/datasources/remote/get_watch_providers_remote_datasource_impl.dart';
import 'package:all_in_one/src/domain/entitites/watch_provider_entity.dart';
import 'package:all_in_one/src/domain/repositories/get_watch_providers_repository_impl.dart';
import 'package:all_in_one/src/domain/usecases/get_watch_providers/get_watch_providers_usecase_impl.dart';
import 'package:all_in_one/src/presentation/riverpod/movies/movies_provider.dart';
import 'package:all_in_one/src/presentation/riverpod/watch_providers/watch_providers_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final watchProviderDatasourceProvider =
    Provider<GetWatchProvidersRemoteDatasourceImpl>(
        (ref) => GetWatchProvidersRemoteDatasourceImpl(ref.watch(dioProvider)));

final watchProviderRepositoryProvider =
    Provider<GetWatchProvidersRepositoryImpl>(((ref) =>
        GetWatchProvidersRepositoryImpl(
            ref.watch(watchProviderDatasourceProvider))));

final watchProviderUsecaseProvider = Provider<GetWatchProvidersUsecaseImpl>(
    ((ref) => GetWatchProvidersUsecaseImpl(
        ref.watch(watchProviderRepositoryProvider))));

final watchProviderStateNotifierProvider =
    StateNotifierProvider<WatchProvidersNotifier, List<WatchProviderEntity>>(
        (ref) {
  return WatchProvidersNotifier(ref.watch(watchProviderUsecaseProvider));
});
