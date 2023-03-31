import 'package:all_in_one/src/domain/entitites/movie_entity.dart';
import 'package:all_in_one/src/presentation/ui/movie_details/widgets/movie_details_page_body.dart';
import 'package:flutter/material.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: MovieDetailsPageBody(movie: movie,),
    );
  }
}
