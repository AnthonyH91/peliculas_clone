import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:peliculas_clone/mis_colores.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:peliculas_clone/widgets/bottom_nav_bar_mio.dart';

import 'package:provider/provider.dart';

class MovieFavourites extends StatelessWidget {
  const MovieFavourites({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as String;

    return Consumer<MoviesProvider>(builder: (BuildContext context, data, _) {
      return Scaffold(
        backgroundColor: MyColors.colorQuinto,
        appBar: AppBar(
          title: Text(args.toUpperCase()),
          leading: IconButton(
              onPressed: () {
                data.actualizarIndice(0);
                         Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              icon: const Icon(Icons.arrow_back)),
          backgroundColor: MyColors.colorSegundo,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Consumer<MoviesProvider>(
                  builder: (BuildContext context, data, _) {
                    List<Widget> widgetPeliculasFavoritas =
                        data.allMovies.map((Movie movie) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0.5),
                          child: 
                              data.listadoPeliculaFavoritos.contains(movie.id)
                                  ? ListTile(
                                      leading: Icon(
                                        Icons.favorite,
                                        color: data.listadoPeliculaFavoritos
                                                .contains(movie.id)
                                            ? Colors.red 
                                            : const Color.fromARGB(
                                                255, 102, 105, 98),
                                      ),
                                      title: Text(
                                        movie.title,
                                        style: TextStyle(
                                          color: MyColors.colorCuarto,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      tileColor: MyColors.colorSegundo,
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
                        children: widgetPeliculasFavoritas,
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
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(140, 40),
                    textStyle: const TextStyle(fontSize: 24),
                    primary: MyColors.colorSegundo,
                    onPrimary: MyColors.colorCuarto,
                  ),
                   onPressed: () {
                        Navigator.pop(context);
                        data.actualizarIndice(1);
                      },
                  child: const Text('Atrás'),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavBarMio(),
      );
    });
  }
}
