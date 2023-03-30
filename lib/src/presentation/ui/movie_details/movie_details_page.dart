import 'package:all_in_one/src/presentation/riverpod/actors/actors_provider.dart';
import 'package:all_in_one/src/presentation/riverpod/watch_providers/watch_provider_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../env/env.dart';
import '../../../../shared/utils/monetary_formatter.dart';
import '../../../../shared/widgets/user_vote_average_animation.dart';
import '../../../domain/entitites/movie_entity.dart';
import '../../../domain/entitites/movie_trailer_entity.dart';
import '../../riverpod/details/movie_details_provider.dart';
import '../../riverpod/trailers/trailer_provider.dart';

class MovieDetailsPage extends StatefulHookConsumerWidget {
  final MovieEntity movie;

  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  ConsumerState<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends ConsumerState<MovieDetailsPage> {
  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    ref
        .read(movieDetaisNotifierProvider.notifier)
        .getMovieDetails(widget.movie.id);
    ref.read(trailerNotifierProvider.notifier).getMovieTrailer(widget.movie.id);
    ref.read(actorsNotifierProvider.notifier).getMovieCast(widget.movie.id);
    ref
        .read(watchProviderStateNotifierProvider.notifier)
        .getWatchProviders(widget.movie.id);
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var movie = Future.delayed(
      const Duration(seconds: 3),
      () => ref.watch(trailerNotifierProvider),
    );
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
                FutureBuilder(
                  future: movie,
                  builder:
                      (context, AsyncSnapshot<MovieTrailerEntity> snapshot) {
                    if (snapshot.data != null) {
                      var trailer = snapshot.data!.trailers;
                      if (trailer.isEmpty) {
                        return const Text(
                          "Ops! Parece que este filme não possui nenhum trailer no momento!",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        );
                      } else {
                        controller = YoutubePlayerController(
                          flags: const YoutubePlayerFlags(
                            autoPlay: false,
                          ),
                          initialVideoId: trailer.first.key,
                        );
                        return Column(
                          children: [
                            Text(
                              trailer.first.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 15),
                            YoutubePlayerBuilder(
                              player: YoutubePlayer(
                                controller: controller!,
                                width: MediaQuery.of(context).size.width * 0.9,
                              ),
                              builder: (context, player) {
                                return Container(
                                  child: player,
                                );
                              },
                            ),
                          ],
                        );
                      }
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue.shade400,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 15),
                details.tagline.isEmpty
                    ? const SizedBox.shrink()
                    : Text(
                        '"${details.tagline}"',
                        style: const TextStyle(fontStyle: FontStyle.italic),
                        textAlign: TextAlign.center,
                      ),
                const SizedBox(
                  height: 15,
                ),
                Container(
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
                                  UserVoteAverageAnimation(
                                      voteAverage: widget.movie.voteAverage),
                                  const SizedBox(width: 10),
                                  const Text(
                                    '''Avaliação \ndos\n Usuários''',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
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
                                      color: ref
                                              .watch(movieDetaisNotifierProvider
                                                  .notifier)
                                              .calculateProfit()
                                          ? const Color.fromARGB(
                                              255, 0, 252, 13)
                                          : Colors.red),
                                  Text(
                                    formatValue(
                                        (details.revenue - details.budget)),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: ref
                                                .watch(
                                                    movieDetaisNotifierProvider
                                                        .notifier)
                                                .calculateProfit()
                                            ? const Color.fromARGB(
                                                255, 0, 252, 13)
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
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
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
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                          Text(
                            ref
                                .watch(movieDetaisNotifierProvider.notifier)
                                .retriveMoviesGenres(),
                            style: const TextStyle(fontSize: 15),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Text(details.overview),
                    ],
                  ),
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
                      SizedBox(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: actors.length > 10 ? 10 : actors.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Column(
                                children: [
                                  actors[index].profilePath == null
                                      ? const CircleAvatar(
                                          radius: 35,
                                          backgroundImage: AssetImage(
                                              'lib/assets/images/avatar.png'),
                                        )
                                      : CircleAvatar(
                                          radius: 35,
                                          backgroundImage: NetworkImage(
                                              '${Env.tmdbImageUrl}${actors[index].profilePath}'),
                                        ),
                                  const SizedBox(height: 2),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      actors[index].name,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      actors[index].character,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 11),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
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
                                'OPS! Parece Que Este Filme Não Está Disponível Em Nehuma Plataforma de Streaming!',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            )
                          : SizedBox(
                              height: 100,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                itemCount: watchProviders.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 35,
                                          backgroundImage: NetworkImage(
                                              '${Env.tmdbImageUrl}${watchProviders[index].logoPath}'),
                                        ),
                                        const SizedBox(height: 2),
                                        SizedBox(
                                          width: 100,
                                          child: Text(
                                            watchProviders[index].providerName,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
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
