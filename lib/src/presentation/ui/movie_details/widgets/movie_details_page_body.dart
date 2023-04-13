import 'package:all_in_one/src/presentation/riverpod/actors/actors_provider.dart';
import 'package:all_in_one/src/presentation/riverpod/watch_providers/watch_provider_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entitites/movie_entity.dart';
import '../../../riverpod/details/movie_details_provider.dart';
import '../../../riverpod/trailers/trailer_provider.dart';
import 'main_actors_listview.dart';
import 'movie_details_middle_container.dart';
import 'movie_trailer_video_player.dart';
import 'streaming_plataforms_listview.dart';

class MovieDetailsPageBody extends StatefulHookConsumerWidget {
  final MovieEntity movie;

  const MovieDetailsPageBody({Key? key, required this.movie}) : super(key: key);

  @override
  ConsumerState<MovieDetailsPageBody> createState() =>
      _MovieDetailsPageBodyState();
}

class _MovieDetailsPageBodyState extends ConsumerState<MovieDetailsPageBody> {
  @override
  void initState() {
    super.initState();
    startProvider();
  }

  startProvider() async {
    await ref
        .read(movieDetaisNotifierProvider.notifier)
        .getMovieDetails(widget.movie.id);
    await ref
        .read(trailerNotifierProvider.notifier)
        .getMovieTrailer(widget.movie.id);
    await ref
        .read(actorsNotifierProvider.notifier)
        .getMovieCast(widget.movie.id);
    await ref
        .read(watchProviderStateNotifierProvider.notifier)
        .getWatchProviders(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    var movie = Future.delayed(const Duration(seconds: 1))
        .then((value) => ref.watch(trailerNotifierProvider));
    var details = ref.watch(movieDetaisNotifierProvider);
    var watchProviders = ref.watch(watchProviderStateNotifierProvider);
    var actors = ref.watch(actorsNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: const Color(0xff2C55E7),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            child: Column(
              children: [
                const SizedBox(height: 30),
                MovieTrailerVideoPlayer(movie: movie),
                const SizedBox(height: 15),
                details.tagline.isEmpty
                    ? const SizedBox.shrink()
                    : Text(
                        '"${details.tagline}"',
                        style: const TextStyle(
                            fontStyle: FontStyle.italic, fontSize: 15),
                        textAlign: TextAlign.center,
                      ),
                const SizedBox(
                  height: 15,
                ),
                MovieDetailsMiddleContainer(
                  voteAverage: widget.movie.voteAverage,
                  details: details,
                  movieGenres: ref
                      .watch(movieDetaisNotifierProvider.notifier)
                      .retriveMoviesGenres(),
                  movieProfit: ref
                      .watch(movieDetaisNotifierProvider.notifier)
                      .calculateProfit(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Atores Principais:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 15),
                      MainActorsListView(actors: actors),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Disponível Em:',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(height: 15),
                      watchProviders.isEmpty
                          ? const Center(
                              child: Text(
                                'OPS! Parece que este filme não está disponível em nenhuma plataforma de streaming no momento!',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : StreamingPlataformsListView(
                              watchProviders: watchProviders),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
