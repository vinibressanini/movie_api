import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../riverpod/movies/movies_provider.dart';
import 'card_movie.dart';

class MoviesPageBody extends StatefulHookConsumerWidget {
  const MoviesPageBody({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<MoviesPageBody> createState() => _MoviesPageBodyState();
}

class _MoviesPageBodyState extends ConsumerState<MoviesPageBody> {
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(infiniteScrolling);
    super.initState();
  }

  infiniteScrolling() {
    if (_controller.position.pixels == _controller.position.maxScrollExtent) {
      ref.watch(moviesNotifierProvider.notifier).getAllTrendingMovies('day');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movies = ref.watch(moviesNotifierProvider);
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmallDevice = constraints.maxHeight < 700;
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
          child: MediaQuery.of(context).orientation == Orientation.landscape
              ? GridView.builder(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 0.65,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return CardMovie(
                      movie: movies[index],
                      isSmallDevice: isSmallDevice,
                    );
                  },
                )
              : GridView.builder(
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: isSmallDevice ? 0.60 : 0.62,
                    mainAxisSpacing: 1,
                  ),
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    return CardMovie(
                      movie: movies[index],
                      isSmallDevice: isSmallDevice,
                    );
                  },
                ),
        );
      },
    );
  }
}
