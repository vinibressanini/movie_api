import 'package:flutter/material.dart';

import '../../../../../shared/utils/date_format..dart';
import '../../../../../shared/widgets/user_vote_average_animation.dart';
import '../../../../domain/entitites/movie_entity.dart';
import '../../movie_details/movie_details_page.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(movie: movie),
        ),
      ),
      child: Stack(
        children: [
          Container(
            height: 260,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 11,
                    spreadRadius: 6,
                    offset: const Offset(5, 7))
              ],
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://image.tmdb.org/t/p/w200/${movie.posterPath}'),
              ),
            ),
            margin: const EdgeInsets.all(15),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                radius: 12,
                child: Icon(
                  Icons.more_horiz_sharp,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 45),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: CircleAvatar(
                radius: 23,
                backgroundColor: Colors.black.withOpacity(0.8),
                child: Stack(
                  children: [
                    TweenAnimationBuilder(
                      curve: Curves.fastOutSlowIn,
                      tween:
                          Tween<double>(begin: 0, end: movie.voteAverage / 10),
                      duration: const Duration(seconds: 2),
                      builder: (context, double valueA, child) {
                        return CircularProgressIndicator(
                            backgroundColor: Colors.black.withOpacity(0.8),
                            color: Colors.greenAccent,
                            value: valueA);
                      },
                    ),
                    Positioned(
                      top: 10,
                      left: 8,
                      child: UserVoteAverageAnimation(movie: movie),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  Text(
                    formatDate(movie.releaseDate),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
