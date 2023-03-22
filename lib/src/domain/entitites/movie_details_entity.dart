class MovieDetailsEntity {
  final int budget;
  final int revenue;
  final String releaseDate;
  final String tagline;
  final List<String> genres;
  final int runtime;
  final String overview;

  MovieDetailsEntity({
    required this.budget,
    required this.revenue,
    required this.releaseDate,
    required this.tagline,
    required this.genres,
    required this.runtime,
    required this.overview,
  });
}
