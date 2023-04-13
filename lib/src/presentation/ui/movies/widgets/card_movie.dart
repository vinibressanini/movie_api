import 'package:flutter/material.dart';

import '../../../../../env/env.dart';
import '../../../../../shared/utils/date_format..dart';
import '../../../../domain/entitites/movie_entity.dart';
import '../../movie_details/movie_details_page.dart';

class CardMovie extends StatelessWidget {
  const CardMovie({
    Key? key,
    required this.movie,
    required this.isSmallDevice,
  }) : super(key: key);

  final MovieEntity movie;
  final bool isSmallDevice;

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;

    double getCardSize() {
      if (orientation == Orientation.portrait && isSmallDevice) {
        return MediaQuery.of(context).size.height * 0.32;
      } else if (orientation == Orientation.portrait && !isSmallDevice) {
        return MediaQuery.of(context).size.height * 0.28;
      } else {
        return MediaQuery.of(context).size.height * 0.44;
      }
    }

    var cardSize = getCardSize();

    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(movie: movie),
        ),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: cardSize,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      blurRadius: 6,
                      spreadRadius: 2,
                      offset: const Offset(3, 5),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        NetworkImage('${Env.tmdbImageUrl}${movie.posterPath}'),
                  ),
                ),
                margin: const EdgeInsets.all(15),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              movie.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          Text(
            formatDate(movie.releaseDate),
            style: const TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
