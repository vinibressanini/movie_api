import 'package:all_in_one/src/domain/entitites/actor_entity.dart';

class ActorDto extends ActorEntity {
  ActorDto({
    required bool adult,
    int? gender,
    required int id,
    required String knownForDepartment,
    required String name,
    required String originalName,
    required double popularity,
    String? profilePath,
    required int castId,
    required String character,
    required String creditId,
    required int order,
  }) : super(
          adult: adult,
          gender: gender,
          id: id,
          knownForDepartment: knownForDepartment,
          name: name,
          originalName: originalName,
          popularity: popularity,
          profilePath: profilePath,
          castId: castId,
          character: character,
          creditId: creditId,
          order: order,
        );

  factory ActorDto.fromMap(Map<String, dynamic> map) {
    return ActorDto(
      adult: map['adult'] ?? false,
      gender: map['gender']?.toInt(),
      id: map['id']?.toInt() ?? 0,
      knownForDepartment: map['known_for_department'],
      name: map['name'] ?? '',
      originalName: map['original_name'] ?? '',
      popularity: map['popularity']?.toDouble() ?? 0.0,
      profilePath: map['profile_path'],
      castId: map['cast_id']?.toInt() ?? 0,
      character: map['character'] ?? '',
      creditId: map['credit_id'] ?? '',
      order: map['order']?.toInt() ?? 0,
    );
  }
}
