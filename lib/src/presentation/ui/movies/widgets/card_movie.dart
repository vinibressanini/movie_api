import 'package:flutter/material.dart';

import '../../../../../shared/utils/date_format..dart';
import '../../../../domain/entitites/movie_entity.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 260,
          decoration: BoxDecoration(
            boxShadow:  [
              BoxShadow(
                color: Colors.grey.shade400,
                blurRadius: 11,
                spreadRadius: 6,
                offset: const Offset(5, 7)
              )
            ] ,
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
                    tween: Tween<double>(begin: 0, end: movie.voteAverage / 10),
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
                    child: TweenAnimationBuilder(
                        curve: Curves.fastOutSlowIn,
                        tween: Tween<double>(begin: 0, end: movie.voteAverage),
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
                        }),
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
    );
  }
}
