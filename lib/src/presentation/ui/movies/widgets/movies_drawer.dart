import 'package:all_in_one/src/presentation/riverpod/movies/movies_provider.dart';
import 'package:all_in_one/src/presentation/riverpod/movies/time_window_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoviesDrawer extends HookConsumerWidget {
  const MoviesDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'M',
              style: TextStyle(fontSize: 100),
            ),
          ),
          ListTile(
            title: const Text('Filmes em Alta Hoje!'),
            onTap: () {
              ref.read(timeWindowProvider.notifier).state = "day";
              ref
                  .read(moviesNotifierProvider.notifier)
                  .getAllTrendingMovies("day");
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Filmes em Alta Nesta Semana!'),
            onTap: () {
              ref.read(timeWindowProvider.notifier).state = "week";
              ref
                  .read(moviesNotifierProvider.notifier)
                  .getAllTrendingMovies("week");
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
