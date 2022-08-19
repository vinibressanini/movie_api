import 'package:flutter/material.dart';

import 'widgets/movies_drawer.dart';
import 'widgets/movies_page_body.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MoviesDrawer(),
      appBar: AppBar(
        title: const Text('All In One'),
        centerTitle: true,
      ),
      body: const MoviesPageBody(),
    );
  }
}
