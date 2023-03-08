import 'package:all_in_one/src/domain/entitites/trailer_info_entity.dart';

class TrailerInfoDto extends TrailerInfoEntity {
  TrailerInfoDto({
    required iso6391,
    required iso31661,
    required name,
    required key,
    required site,
    required size,
    required type,
    required official,
  }) : super(
          iso6391: iso6391,
          iso31661: iso31661,
          name: name,
          key: key,
          site: site,
          size: size,
          type: type,
          official: official,
        );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'iso_639_1': iso6391});
    result.addAll({'iso31661': iso31661});
    result.addAll({'name': name});
    result.addAll({'key': key});
    result.addAll({'site': site});
    result.addAll({'size': size});
    result.addAll({'type': type});
    result.addAll({'official': official});

    return result;
  }

  factory TrailerInfoDto.fromMap(Map<String, dynamic> map) {
    return TrailerInfoDto(
      iso6391: map['iso_639_1'] ?? '',
      iso31661: map['iso_3166_1'] ?? '',
      name: map['name'] ?? '',
      key: map['key'] ?? '',
      site: map['site'] ?? '',
      size: map['size']?.toInt() ?? 0,
      type: map['type'] ?? '',
      official: map['official'] ?? false,
    );
  }
}
