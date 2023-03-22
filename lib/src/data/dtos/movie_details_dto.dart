import '../../../shared/utils/date_format..dart';
import '../../domain/entitites/movie_details_entity.dart';

class MovieDetailsDto extends MovieDetailsEntity {
  MovieDetailsDto({
    required int budget,
    required int revenue,
    required String releaseDate,
    required String tagline,
    required List<String> genres,
    required int runtime,
    required String overview,
  }) : super(
          budget: budget,
          revenue: revenue,
          releaseDate: releaseDate,
          tagline: tagline,
          genres: genres,
          runtime: runtime,
          overview: overview,
        );

  factory MovieDetailsDto.fromMap(Map<String, dynamic> map) {
    return MovieDetailsDto(
      budget: map['budget']?.toInt() ?? 0,
      revenue: map['revenue']?.toInt() ?? 0,
      releaseDate: formatDate(map['release_date']),
      tagline: map['tagline'] ?? '',
      genres: List<String>.from(map['genres']?.map((x) => x['name'])),
      runtime: map['runtime']?.toInt() ?? 0,
      overview: map['overview'] ?? '',
    );
  }
}
