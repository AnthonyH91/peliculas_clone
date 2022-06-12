import 'dart:math';

import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:peliculas_clone/controlador.dart';
import 'package:peliculas_clone/mis_colores.dart';

import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:peliculas_clone/widgets/bottom_nav_bar_mio.dart';

import 'package:peliculas_clone/widgets/card_mio.dart';

import 'package:provider/provider.dart';

class MoviesTotals extends StatefulWidget {
  const MoviesTotals({Key key}) : super(key: key);

  @override
  State<MoviesTotals> createState() => _MoviesTotalsState();
}

class _MoviesTotalsState extends State<MoviesTotals> {
  String _urlDelServicioSolicitado;

  get urlDelServicioSolicitado => _urlDelServicioSolicitado;

  int indexDelListadoPeliculas = 0;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;

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
              icon: const Icon(Icons.arrow_back),),
        backgroundColor: MyColors.colorSegundo,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search),
              tooltip: 'Buscar',
            ),
          /*PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(child: Text('Ayuda')),
                const PopupMenuItem(child: Text('Recomendar APP'))
              ];
            },
          )*/
        ],
      ),
      body: Consumer<MoviesProvider>(builder: (BuildContext context, data, _) {
        if (data.allMovies.isEmpty) {
          return const Center(
              child: Image(
            image: AssetImage('assets/Cube.gif'),
          ));
        }

        List<MovieCard> widgetpeliculas = data.allMovies.map((Movie movie) {
          
          return MovieCard(
            title: movie.title,
            thumbnailUrl: getImage(movie.image),
            rating: movie.average,
            release: movie.release,
            id: movie.id,
          );
        }).toList();

        return Column(
          children: [
            const SizedBox(height: 20),
            Consumer<MoviesProvider>(
              builder: (BuildContext context, data, _) {
                return Card(
                  color: MyColors.colorTercero,
                  elevation: 10,
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Ink.image(
                            image: const AssetImage('assets/Cube.gif'),
                            child: InkWell(
                              onTap: () {},
                            ),
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                          const Positioned(
                            bottom: 16,
                            right: 16,
                            left: 16,
                            child: Text(
                              'SELECCION',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                        child: const Text(
                          'Elegi la pelicula que desees para ver su descripcion, sino podes elegir una al azar',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ButtonBar(
                        
                        alignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              int numeroAzar = Random().nextInt(data.allMovies.length);
                              Navigator.pushNamed(context, ('/movie_details'),
                                  arguments: data.allMovies[numeroAzar]);
                            },
                            child: Text('ELEGIR AL AZAR',
                                style: TextStyle(
                                  color: MyColors.colorCuarto,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, ('/movie_details'),
                                  arguments:
                                      data.allMovies[indexDelListadoPeliculas]);
                            },
                            child: Text('DETALLES DE LA PELICULA',
                                style: TextStyle(
                                  color: MyColors.colorCuarto,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            const Divider(),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 350,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.004,
                children: widgetpeliculas,
                onSelectedItemChanged: (index) {
                  
                  
                  setState(() {
                    indexDelListadoPeliculas = index;
                  });

                  /*ScaffoldMessenger.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                      duration: Duration(seconds: 2),
                      content: Text('MORE INFORMATION'),
                      action: SnackBarAction(
                          label: 'DETAILS',
                          onPressed: () {
                            ///ENVIO DE ARGUMENTO EL OBJETO INDIVIDUAL!!!!!!
                          }),
                    ));*/
                },
              ),
            ),
          ],
        );
      }),
      bottomNavigationBar: const BottomNavBarMio(),
    );
  });
}
}