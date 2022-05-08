import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';

import 'package:provider/provider.dart';

class MovieFavourites extends StatelessWidget {
  MovieFavourites({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listados de Favoritos'),
        centerTitle: true,
        leading: Container(),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Consumer<MoviesProvider>(
                builder: (BuildContext context, data, _) {
                  //consumer de tipo jugadorProvider
                  List<Widget> widgetPeliculas = data.movies.map((Movie movie) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: data.listadoPeliculaFavoritos.contains(movie.id)
                            ? ListTile(
                                leading: Icon(
                                  Icons.verified_user,
                                  color: data.listadoPeliculaFavoritos
                                          .contains(movie.id)
                                      ? Colors.red
                                      : Colors.blueGrey,
                                ),
                                title: Text(movie.title),
                                textColor: Colors.black,
                                trailing: FadeInImage.assetNetwork(
                                  image: getImage(movie.image),
                                  placeholder: "assets/Cube.gif",
                                  imageCacheWidth: 50,
                                  width: 50,
                                ),
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/movie_details',
                                    arguments: movie,
                                  );
                                },
                              )
                            : null);
                  }).toList();

                  return Expanded(
                    child: ListView(
                      children: widgetPeliculas,
                    ),
                  );
                },
              ),
              /*ElevatedButton(
                onPressed: () {
                  //Navigator.pushNamed(context, '/listviewjugbas');
                },
                child: const Text('Ver plantilla de jugadores'),
              ),*/
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: const Text('Atrás'),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
      ),
    );
  }
}
