import 'package:all_in_one/shared/widgets/user_vote_average_animation.dart';
import 'package:all_in_one/src/presentation/riverpod/details/movie_details_provider.dart';
import 'package:all_in_one/src/presentation/riverpod/trailers/trailer_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entitites/movie_entity.dart';
import '../../../domain/entitites/movie_trailer_entity.dart';

class MovieDetailsPage extends StatefulHookConsumerWidget {
  final MovieEntity movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  ConsumerState<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends ConsumerState<MovieDetailsPage> {
  // late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    ref
        .read(movieDetaisNotifierProvider.notifier)
        .getMovieDetails(widget.movie.id);
    ref.read(trailerNotifierProvider.notifier).getMovieTrailer(widget.movie.id);
  }

  @override
  void dispose() {
    // controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var movie = Future.delayed(
      const Duration(seconds: 1),
      () => ref.watch(trailerNotifierProvider),
    );
    var details = ref.watch(movieDetaisNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
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
              const SizedBox(height: 30),
              FutureBuilder(
                future: movie,
                builder: (context, AsyncSnapshot<MovieTrailerEntity> snapshot) {
                  if (snapshot.data != null) {
                    if (snapshot.data!.trailers.isEmpty) {
                      return const Text(
                        "Ops! Parece que este filme não possui nenhum trailer no momento!",
                        style: TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      );
                    }
                    // controller = YoutubePlayerController(
                    //   flags: const YoutubePlayerFlags(
                    //     autoPlay: false,
                    //   ),
                    //   initialVideoId: '7FzN6eolIIc',
                    // );

                    return Column(
                      children: [
                        Text(
                          snapshot.data!.trailers.first.name,
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.black,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // YoutubePlayer(
                        //   controller: controller,
                        //   width: MediaQuery.of(context).size.width * 0.9,
                        // ),
                      ],
                    );
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue.shade400,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  UserVoteAverageAnimation(
                      voteAverage: widget.movie.voteAverage),
                  const Text(
                    '''Avaliação \ndos\n Usuários''',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(details.releaseDate),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
