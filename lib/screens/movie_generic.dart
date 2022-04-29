import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:peliculas_clone/controlador.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:peliculas_clone/widgets/card_mio.dart';

import 'package:provider/provider.dart';

class MoviesGenerics extends StatelessWidget {
  MoviesGenerics({Key key}) : super(key: key);
  String _urlDelServicioSolicitado;

  get urlDelServicioSolicitado => _urlDelServicioSolicitado;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        onPressed: () => Provider.of<MoviesProvider>(context,listen: false)
            .getListadoPeliculas(_urlDelServicioSolicitado),
      ),*/
      appBar: AppBar(
        title: Text(args),
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
      body: Consumer<MoviesProvider>(
        builder: (BuildContext context, data, _) {
          if (data.movies.isEmpty) {
            return Center(
                child: Image(
              image: AssetImage('assets/Cube.gif'),
            ));
          }

          List<Widget> widgetpeliculas = data.movies.map((Movie movie) {
            return MovieCard(
              title: movie.title,
              thumbnailUrl: getImage(movie.image),
              rating: movie.average,
              release: movie.release,
            );
          }).toList();

          return Column(
            children: [
            const SizedBox(height: 20), 
            Card(
              shadowColor: Colors.red,
              elevation: 8,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.red],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Colored card',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        'This card is rounded and has a gradient',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            Divider(),
              Expanded(
                child: ListWheelScrollView(
                    itemExtent: 250,
                    physics: FixedExtentScrollPhysics(),
                    perspective: 0.004,
                    children: widgetpeliculas),
              ),
            ],
          );
        },
      ),
    );
  }
}
