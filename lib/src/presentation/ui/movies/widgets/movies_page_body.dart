import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../riverpod/movies/movies_provider.dart';
import 'card_movie.dart';

class MoviesPageBody extends HookConsumerWidget {
  const MoviesPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(moviesNotifierProvider);

    return Visibility(
      visible: movies.isNotEmpty,
      replacement: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 260.0,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 260.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.61,
          mainAxisSpacing: 1,
        ),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return CardMovie(movie: movies[index]);
        },
      ),
    );
  }
}
