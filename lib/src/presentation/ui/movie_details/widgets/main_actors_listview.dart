import 'package:flutter/material.dart';

import '../../../../../env/env.dart';
import '../../../../domain/entitites/actor_entity.dart';

class MainActorsListView extends StatelessWidget {
  const MainActorsListView({
    Key? key,
    required this.actors,
  }) : super(key: key);

  final List<ActorEntity> actors;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: actors.length > 10 ? 10 : actors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                actors[index].profilePath == null
                    ? const CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            AssetImage('lib/assets/images/avatar.png'),
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
                        fontWeight: FontWeight.bold, fontSize: 12),
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
    );
  }
}