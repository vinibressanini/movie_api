import 'package:all_in_one/src/domain/entitites/trailer_info_entity.dart';

class MovieTrailerEntity {
  final int id;
  final List<TrailerInfoEntity> trailers;

  MovieTrailerEntity({
    required this.id,
    required this.trailers,
  });
}
