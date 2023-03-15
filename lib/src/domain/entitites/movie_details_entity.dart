import 'package:all_in_one/src/data/dtos/genres_dto.dart';
import 'package:all_in_one/src/domain/entitites/genres_entity.dart';

class MovieDetailsEntity {
  final int budget;
  final int revenue;
  final String releaseDate;
  final String tagline;
  final List<GenresEntity> genres;
  final int runtime;

  MovieDetailsEntity({
    required this.budget,
    required this.revenue,
    required this.releaseDate,
    required this.tagline,
    required this.genres,
    required this.runtime,
  });
}
