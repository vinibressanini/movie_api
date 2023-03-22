import 'package:all_in_one/src/domain/entitites/watch_provider_entity.dart';

class WatchProviderDto extends WatchProviderEntity {
  WatchProviderDto({
    required int id,
    required String logoPath,
    required String providerName,
    required int displayPriority,
  }) : super(
          id: id,
          logoPath: logoPath,
          providerName: providerName,
          displayPriority: displayPriority,
        );

  factory WatchProviderDto.fromMap(Map<String, dynamic> map) {
    return WatchProviderDto(
      id: map['provider_id']?.toInt() ?? 0,
      logoPath: map['logo_path'] ?? '',
      providerName: map['provider_name'] ?? '',
      displayPriority: map['display_priority']?.toInt() ?? 0,
    );
  }
}
