import 'package:flutter/material.dart';

import '../../../../../env/env.dart';
import '../../../../../shared/utils/date_format..dart';
import '../../../../../shared/widgets/user_vote_average_animation.dart';
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
                height: isSmallDevice
                    ? MediaQuery.of(context).size.height * 0.32
                    : MediaQuery.of(context).size.height * 0.28,
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
              Positioned(
                height: isSmallDevice
                    ? MediaQuery.of(context).size.height * 0.66
                    : MediaQuery.of(context).size.height * 0.57,
                left: 25,
                child: CircleAvatar(
                  radius: 23,
                  backgroundColor: Colors.black.withOpacity(0.8),
                  child:
                      UserVoteAverageAnimation(voteAverage: movie.voteAverage),
                ),
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
