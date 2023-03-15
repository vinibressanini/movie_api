import 'dart:convert';

import 'package:all_in_one/src/domain/entitites/genres_entity.dart';

class GenresDto extends GenresEntity {
 
  GenresDto({
    required String name,
  }) : super(
          name: name,
        );

  factory GenresDto.fromMap(Map<String, dynamic> map) {
    return GenresDto(
      name: map['name'] ?? '',
    );
  }
}
