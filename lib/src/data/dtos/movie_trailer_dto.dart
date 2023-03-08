import 'package:all_in_one/src/data/dtos/trailer_info_dto.dart';
import 'package:all_in_one/src/domain/entitites/movie_trailer_entity.dart';

class MovieTrailerDto extends MovieTrailerEntity {
  MovieTrailerDto({
    required id,
    required trailers,
  }) : super(
          id: id,
          trailers: trailers,
        );

  factory MovieTrailerDto.fromMap(Map<String, dynamic> map) {
    return MovieTrailerDto(
      id: map['id']?.toInt() ?? 0,
      trailers: List<TrailerInfoDto>.from(
          map['results']?.map((trailer) => TrailerInfoDto.fromMap(trailer))),
    );
  }
}
