import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:peliculas_clone/controlador.dart';
import 'package:peliculas_clone/widgets/card_mio.dart';

class MoviesRecent extends StatelessWidget {
  const MoviesRecent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RECENT MOVIES'),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('Ayuda')),
                const PopupMenuItem(child: Text('Recomendar APP'))
              ];
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: getListadoPeliculasRecientes(),
        builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
          if (snapshot.hasData) {
            List<Movie> peliculas = snapshot.data;

            List<Widget> widgetpeliculas = peliculas.map((Movie movie) {
              return MovieCard(
                title: movie.title,
                thumbnailUrl: getImage(movie.image),
                rating: movie.average,
                release: movie.release,
              );
            }).toList();

            return ListWheelScrollView(
                itemExtent: 250,
                physics: FixedExtentScrollPhysics(),
                perspective: 0.004,
                children: widgetpeliculas);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
