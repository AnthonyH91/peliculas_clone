import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class GridViewMio extends StatelessWidget {
  const GridViewMio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(builder: (BuildContext context, data, _) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemCount: data.allMovies.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: GestureDetector(
                  onTap: (){
                      Navigator.pushNamed(context, ('/movie_details'),
                                    arguments:
                                        data.allMovies[index]);
                    },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            getImage(data.allMovies[index].image)),
                      ),
                    ),
                  ),
                ),
              ),
            );
          });
    });
  }
}
