import 'package:all_in_one/src/presentation/riverpod/trailers/trailer_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../domain/entitites/movie_entity.dart';
import '../../../domain/entitites/movie_trailer_entity.dart';

class MovieDetailsPage extends StatefulHookConsumerWidget {
  final MovieEntity movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  ConsumerState<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends ConsumerState<MovieDetailsPage> {
  late final YoutubePlayerController controller;
  bool isReady = false;

  @override
  void initState() {
    super.initState();
    ref.read(trailerNotifierProvider.notifier).getMovieTrailer(widget.movie.id);
  }

  @override
  Widget build(BuildContext context) {
    var movie = Future.delayed(
      const Duration(seconds: 2),
      () => ref.watch(trailerNotifierProvider),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.5,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/original/${widget.movie.backdropPath}'),
          ),
        ),
        child: Column(
          children: [
            Text(
              widget.movie.originalTitle,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            FutureBuilder(
              future: movie,
              builder: (context, AsyncSnapshot<MovieTrailerEntity> snapshot) {
                if (snapshot.data != null) {
                  controller = YoutubePlayerController(
                      initialVideoId: snapshot.data!.trailers.first.key);

                  return YoutubePlayer(
                    controller: controller,
                    width: MediaQuery.of(context).size.width * 0.8,
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
