class ActorEntity {
  final bool adult;
  final int? gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String? profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;

  ActorEntity(
      {required this.adult,
      this.gender,
      required this.id,
      required this.knownForDepartment,
      required this.name,
      required this.originalName,
      required this.popularity,
      this.profilePath,
      required this.castId,
      required this.character,
      required this.creditId,
      required this.order});
}
