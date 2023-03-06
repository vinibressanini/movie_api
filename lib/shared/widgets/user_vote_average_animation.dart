import 'package:flutter/material.dart';

import '../../src/domain/entitites/movie_entity.dart';

class UserVoteAverageAnimation extends StatelessWidget {
  const UserVoteAverageAnimation({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        curve: Curves.fastOutSlowIn,
        tween:
            Tween<double>(begin: 0, end: movie.voteAverage),
        duration: const Duration(seconds: 2),
        builder: (context, double valueA, child) {
          return Text(
            '${(valueA * 10).toString().substring(0, 2)}%',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          );
        });
  }
}