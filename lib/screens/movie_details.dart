import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MoviesDetails extends StatefulWidget {
  MoviesDetails({Key key}) : super(key: key);

  @override
  State<MoviesDetails> createState() => _MoviesDetailsState();
}

class _MoviesDetailsState extends State<MoviesDetails> {
  bool isFavourite = false;

  @override
  Widget build(BuildContext context) {
    //final args = ModalRoute.of(context).settings.arguments as int;
    final peliculaSeleccionada =
        ModalRoute.of(context).settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          peliculaSeleccionada.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 50),
            onPressed: () {
              context
                  .read<MoviesProvider>()
                  .agregarEliminarPeliculaFavoritos(peliculaSeleccionada.id);
            },
            icon: Consumer<MoviesProvider>(builder: (context, data, _) {
              bool esFav = data.listadoPeliculaFavoritos
                  .contains(peliculaSeleccionada.id);

              return Icon(
                // ignore: dead_code
                esFav ? Icons.favorite : Icons.favorite_outline,
                // ignore: dead_code
                color: esFav ? Colors.red : Color.fromARGB(255, 246, 255, 0),
                size: 50,
              );
            }),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(0, 250, 250, 250),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(getImage(peliculaSeleccionada.image))),
                  
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF1a1a2c),
                      Color(0xFF1a1a2c).withOpacity(0.8),
                      Color(0xFF1a1a2c).withOpacity(0.5),
                      Colors.transparent,
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        peliculaSeleccionada.title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "${peliculaSeleccionada.release}, Lanzamiento",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(
                            peliculaSeleccionada.average.toString(),
                            style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(width: 5),
                          ...List.generate(
                            5,
                            (index) => Icon(
                              Icons.star,
                              color: (index <
                                      (double.parse(peliculaSeleccionada.average) /
                                              2)
                                          .floor())
                                  ? Colors.yellow
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ElevatedButton(
                    onPressed: () {
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    child: const Text('Atrás'),
                  ),],
                    
                  ),
                ),
              ),
            
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SingleChildScrollView(
                child: Text(
                  peliculaSeleccionada.overview,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
           
          ],
        ),
      ),
    );
  }
}
          


            
/*Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
                  
                  Text(peliculaSeleccionada.title),
                  Text(peliculaSeleccionada.average),
                  Text(peliculaSeleccionada.release),
                  
                      */