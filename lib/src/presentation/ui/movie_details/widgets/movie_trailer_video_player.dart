import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../domain/entitites/movie_trailer_entity.dart';

class MovieTrailerVideoPlayer extends StatelessWidget {
  MovieTrailerVideoPlayer({
    Key? key,
    required this.movie,
  }) : super(key: key);

  YoutubePlayerController? controller;
  final Future<MovieTrailerEntity> movie;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: movie,
      builder: (context, AsyncSnapshot<MovieTrailerEntity> snapshot) {
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
    );
  }
}
