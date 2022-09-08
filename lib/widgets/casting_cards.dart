import 'package:flutter/material.dart';
import '../models/models.dart';
import '../providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({Key? key, required this.movieId}) : super(key: key);
  final int movieId;

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvdier>(context);
    final size = MediaQuery.of(context).size;

    return FutureBuilder(
        future: moviesProvider.getMovieCast(movieId),
        builder: (_, AsyncSnapshot<List<Cast>> snapshot) {
          if (!snapshot.hasData) {
            return Container(
              width: double.infinity,
              height: size.height * 0.5,
              child: const Center(child: CircularProgressIndicator()),
            );
          }

          final cast = snapshot.data;

          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            width: double.infinity,
            height: 190,
            child: ListView.builder(
                itemCount: cast!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, int index) {
                  Cast myCast = cast[index];
                  return _CastCard(cast: myCast);
                }),
          );
        });
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key, required this.cast}) : super(key: key);
  final Cast cast;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 130,
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
            placeholder: const AssetImage('assets/no-image.jpg'),
            image: NetworkImage(cast.fullProfilePath),
            height: 140,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          cast.name!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
