import 'package:all_in_one/src/domain/entitites/movie_video_entity.dart';
import 'package:all_in_one/src/presentation/riverpod/trailers/trailer_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../domain/entitites/movie_entity.dart';

class MovieDetailsPage extends HookConsumerWidget {
  final MovieEntity movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(trailerNotifierProvider.notifier).getMovieTrailer(movie.id);

    final List<MovieVideoEntity> trailers = ref.read(trailerNotifierProvider);

    final YoutubePlayerController controller =
        YoutubePlayerController(initialVideoId: trailers[1].key);

    return Scaffold(
      appBar: AppBar(
        title: const Text("aaaqa"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.5,
            image: NetworkImage(
                'https://image.tmdb.org/t/p/original/${movie.backdropPath}'),
          ),
        ),
        child: Column(
          children: [
            Text(
              movie.originalTitle,
              style: const TextStyle(
                fontSize: 35,
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              trailers[1].name,
              style: const TextStyle(fontSize: 22),
            ),
            YoutubePlayer(
              width: MediaQuery.of(context).size.width * 0.8,
              controller: controller,
              controlsTimeOut: const Duration(seconds: 2),
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
