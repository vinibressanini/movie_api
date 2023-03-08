import 'dart:convert';

import '../../domain/entitites/movie_entity.dart';

class MovieDto extends MovieEntity {
  MovieDto({
    required bool adult,
    required String backdropPath,
    required int id,
    required String title,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required String posterPath,
    required String mediaType,
    required List<int> genreIds,
    required double popularity,
    required String releaseDate,
    required bool video,
    required double voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          id: id,
          title: title,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          posterPath: posterPath,
          mediaType: mediaType,
          genreIds: genreIds,
          popularity: popularity,
          releaseDate: releaseDate,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );


  factory MovieDto.fromMap(Map<String, dynamic> map) {
    return MovieDto(
      adult: map['adult'] ?? false,
      backdropPath: map['backdrop_path'] ?? '',
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      originalLanguage: map['original_language'] ?? '',
      originalTitle: map['original_title'] ?? '',
      overview: map['overview'] ?? '',
      posterPath: map['poster_path'] ?? '',
      mediaType: map['media_type'] ?? '',
      genreIds: List<int>.from(map['genre_ids']),
      popularity: map['popularity']?.toDouble() ?? 0.0,
      releaseDate: map['release_date'] ?? '',
      video: map['video'] ?? false,
      voteAverage: map['vote_average']?.toDouble() ?? 0.0,
      voteCount: map['vote_count']?.toInt() ?? 0,
    );
  }

}
