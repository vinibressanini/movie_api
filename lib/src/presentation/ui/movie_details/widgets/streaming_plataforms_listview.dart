import 'package:flutter/material.dart';

import '../../../../../env/env.dart';
import '../../../../domain/entitites/watch_provider_entity.dart';

class StreamingPlataformsListView extends StatelessWidget {
  const StreamingPlataformsListView({
    Key? key,
    required this.watchProviders,
  }) : super(key: key);

  final List<WatchProviderEntity> watchProviders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: watchProviders.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        fontWeight: FontWeight.bold, fontSize: 12),
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
