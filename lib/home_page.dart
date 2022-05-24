import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/genres.dart';
import 'package:peliculas_clone/controlador.dart';
import 'package:peliculas_clone/providers/genre_provider.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';

import 'package:peliculas_clone/widgets/bottom_nav_bar_mio.dart';
import 'package:peliculas_clone/widgets/chip_mio.dart';
import 'package:peliculas_clone/widgets/drawer_mio.dart';
import 'package:peliculas_clone/widgets/gridview_mio.dart';

import 'package:peliculas_clone/widgets/swiper_mio.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    
    Provider.of<GenreProvider>(context, listen: false).getListadogeneros(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page');
    

    Provider.of<MoviesProvider>(context, listen: false)
              .getListadoPeliculas('Proximamente');


final List<String> _listaDirecciones = ['Populares','Recientes','Proximamente',
    
  ];

for (int i = 0; i < _listaDirecciones.length ; i++) {

              Provider.of<MoviesProvider>(context, listen: false)
              .getListadoPeliculasTotal(_listaDirecciones[i]);

            }


    return SafeArea(
      child: Scaffold(
        drawer: DrawerMio(),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 34, 2, 36),
          actions: [
            IconButton(
              onPressed: () {
                showSearch<String>(
                    context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search),
              tooltip: 'Buscar',
            ),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(child: Text('Ayuda')),
                  const PopupMenuItem(child: Text('Recomendar APP'))
                ];
              },
            )
          ],
          title: const Text('MOVIES APP'),
        ),
        body: Consumer<GenreProvider>(
          builder: (BuildContext context, data, _) {
            List<ChipGenero> widgetgeneros = data.genres.map((Genre genero) {
              return ChipGenero(
                id: genero.id,
                nameGenre: genero.nameGenre,
              );
            }).toList();



            return ListView(
              children: <Widget>[
                const Divider(thickness: 10.0, color: Colors.red),
                SwiperMio(),
                const Divider(thickness: 10.0, color: Colors.red),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: widgetgeneros,
                    
                  ),
                ),
                const Divider(thickness: 10.0, color: Colors.red),
                const SizedBox(
                  child: GridViewMio(),
                  height: 390,
                ),
              ],
            );
          },
        ),
        bottomNavigationBar: BottomNavBarMio(),
      ),
    );
  }
}
