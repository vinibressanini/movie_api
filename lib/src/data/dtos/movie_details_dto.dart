import 'package:all_in_one/src/domain/entitites/genres_entity.dart';

import '../../../shared/utils/date_format..dart';
import '../../domain/entitites/movie_details_entity.dart';
import 'genres_dto.dart';

class MovieDetailsDto extends MovieDetailsEntity {
  MovieDetailsDto({
    required int budget,
    required int revenue,
    required String releaseDate,
    required String tagline,
    required List<GenresEntity> genres,
    required int runtime,
  }) : super(
          budget: budget,
          revenue: revenue,
          releaseDate: releaseDate,
          tagline: tagline,
          genres: genres,
          runtime: runtime,
        );

  factory MovieDetailsDto.fromMap(Map<String, dynamic> map) {
    return MovieDetailsDto(
      budget: map['budget']?.toInt() ?? 0,
      revenue: map['revenue']?.toInt() ?? 0,
      releaseDate: formatDate(map['release_date']),
      tagline: map['tagline'] ?? '',
      genres: List<GenresEntity>.from(
          map['genres']?.map((x) => GenresDto.fromMap(x))),
      runtime: map['runtime']?.toInt() ?? 0,
    );
  }
}
