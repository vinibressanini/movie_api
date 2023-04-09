import 'package:flutter/material.dart';

import '../../../../../shared/utils/monetary_formatter.dart';
import '../../../../../shared/widgets/user_vote_average_animation.dart';
import '../../../../domain/entitites/movie_details_entity.dart';

class MovieDetailsMiddleContainer extends StatelessWidget {
  const MovieDetailsMiddleContainer(
      {Key? key,
      required this.voteAverage,
      required this.details,
      required this.movieProfit,
      required this.movieGenres})
      : super(key: key);

  final double voteAverage;
  final String movieGenres;
  final MovieDetailsEntity details;
  final bool movieProfit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      UserVoteAverageAnimation(voteAverage: voteAverage),
                      const SizedBox(width: 10),
                      const Text(
                        '''Avaliação \ndos\n Usuários''',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.attach_money_sharp,
                          color: movieProfit
                              ? const Color.fromARGB(255, 0, 252, 13)
                              : Colors.red),
                      Text(
                        formatValue((details.revenue - details.budget)),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: movieProfit
                                ? const Color.fromARGB(255, 0, 252, 13)
                                : Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Text(
                'Data de Lançamento: ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              Text(
                details.releaseDate,
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Text(
                'Gêneros: ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Text(
                  movieGenres,
                  style: const TextStyle(fontSize: 15),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          Text(details.overview),
        ],
      ),
    );
  }
}
