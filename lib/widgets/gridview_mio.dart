import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class GridViewMio extends StatelessWidget {
  const GridViewMio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<MoviesProvider>(
                builder: (BuildContext context, data, _) {
                  if (data.movies.isEmpty) {
          return const Center(
              child: Image(
            image: AssetImage('assets/Cube.gif'),
          ));
        }
              return ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          getImage(data.allMovies[index].image)),
                    ),
                  ),
                ),
              );
            }),
          );
        });
  }
}
