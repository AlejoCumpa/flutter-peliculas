import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies_provider.dart';
import 'package:peliculas/search/search_delegate.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvdier>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Películas en cinces'),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MovieSearchDelegate());
              },
              icon: Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        CardSwiper(movies: moviesProvider.onDisplayMovies),
        MovieSlider(
            popularMovies: moviesProvider.popularMovies,
            onNextPage: () => moviesProvider.getPopularMovies(),
            title: 'Populares')
      ])),
    );
  }
}
