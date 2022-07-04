import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/genres.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:peliculas_clone/controlador.dart';
import 'package:peliculas_clone/mis_colores.dart';
import 'package:peliculas_clone/providers/genre_provider.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:peliculas_clone/widgets/bottom_nav_bar_mio.dart';
import 'package:peliculas_clone/widgets/chip_mio.dart';
import 'package:peliculas_clone/widgets/drawer_mio.dart';
import 'package:peliculas_clone/widgets/gridview_mio.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<GenreProvider>(context, listen: false).getListadogeneros(
        'https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page');

    final List<String> _listaDirecciones = [
      'Populares',
      'Recientes',
      'Proximamente',
    ];

    for (int i = 0; i < _listaDirecciones.length; i++) {
      Provider.of<MoviesProvider>(context, listen: false)
          .getListadoPeliculasTotal(_listaDirecciones[i]);
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.colorQuinto,
        drawer: DrawerMio(),
        appBar: AppBar(
          backgroundColor: MyColors.colorSegundo,
          actions: [
            IconButton(
              onPressed: () {
                showSearch(context: context, delegate: MySearchDelegate());
              },
              icon: const Icon(Icons.search),
              tooltip: 'Buscar',
            ),
            PopupMenuButton(
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: ListTile(
                      leading: Image.asset('assets/iconapp.png'),
                      title: const Text('ABOUT'),
                      trailing: const Icon(Icons.info),
                      onTap: () => showSimpleDialog(context),
                    ),
                  )
                ];
              },
            ),
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

            return Consumer<MoviesProvider>(
              builder: (BuildContext context, data, _) {
                List<Widget>? widgetpeliculas =
                    data.allMovies.map((Movie pelicula) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, ('/movie_details'),
                                    arguments:
                                        pelicula);
                    },
                    child: Image.network(
                      
                      getImage(pelicula.image),
                      fit: BoxFit.fill,
                      width: 250,
                      height: 200,
                    ),
                  );
                }).toList();

                return ListView(
                  children: <Widget>[
                    Divider(thickness: 10.0, color: MyColors.colorSegundo),
                    CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        aspectRatio: 2.0,
                        enlargeCenterPage: true,
                      ),
                      items: widgetpeliculas,
                    ),
                    Divider(thickness: 10.0, color: MyColors.colorSegundo),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: widgetgeneros,
                      ),
                    ),
                    Divider(thickness: 10.0, color: MyColors.colorSegundo),
                    const SizedBox(
                      child: GridViewMio(),
                      height: 320,
                    ),
                  ],
                );
              },
            );
           
          },
        ),
        bottomNavigationBar: const BottomNavBarMio(),
      ),
    );
  }

  showSimpleDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: const Text('APP DESARROLLADA POR ANTHONY HANONO'),
          children: <Widget>[
            SimpleDialogOption(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              onPressed: () {
                Navigator.pop(context);
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Container(
                  height: 300,
                  width: 200,
                  decoration: BoxDecoration(
                    color: MyColors.colorSexto.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(width: 2, color: Colors.white30),
                    image: const DecorationImage(
                        image: AssetImage('assets/iconapp.png'),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
