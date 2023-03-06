import 'dart:convert';

import 'package:all_in_one/src/domain/entitites/movie_video_entity.dart';

class MovieTrailerDto extends MovieVideoEntity {
  MovieTrailerDto({
    required String id,
    required String iso6391,
    required String iso31661,
    required String name,
    required String key,
    required String site,
    required int size,
    required String type,
    required bool official,
  }) : super(
          id: id,
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

    result.addAll({'id': id});
    result.addAll({'iso_639_1': iso6391});
    result.addAll({'iso_3166_1': iso31661});
    result.addAll({'name': name});
    result.addAll({'key': key});
    result.addAll({'site': site});
    result.addAll({'size': size});
    result.addAll({'type': type});
    result.addAll({'official': official});

    return result;
  }

  factory MovieTrailerDto.fromMap(Map<String, dynamic> map) {
    return MovieTrailerDto(
      id: map['id'] ?? '',
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

  String toJson() => json.encode(toMap());

  factory MovieTrailerDto.fromJson(String source) =>
      MovieTrailerDto.fromMap(json.decode(source));
}
