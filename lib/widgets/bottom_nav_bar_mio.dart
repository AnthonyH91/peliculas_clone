import 'package:flutter/material.dart';

import 'package:peliculas_clone/mis_colores.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBarMio extends StatefulWidget {
  const BottomNavBarMio({Key key}) : super(key: key);

  @override
  State<BottomNavBarMio> createState() => _BottomNavBarMioState();
}

class _BottomNavBarMioState extends State<BottomNavBarMio> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesProvider>(
      builder: (BuildContext context, data, _) {
        return BottomNavigationBar(
          backgroundColor: MyColors.colorTercero,
          selectedItemColor: MyColors.colorCuarto,
          iconSize: 24,
          selectedFontSize: 18,
          currentIndex: data.indiceScreen,
          onTap: (int indice) {
            if (data.indiceScreen != indice) {
              data.actualizarIndice(indice);

              if (data.indiceScreen == 0) {
                Navigator.pushNamed(context, ('/'));
              } else if (data.indiceScreen == 1) {
                Navigator.pushNamed(context, ('/movie_totals'),
                    arguments: 'Listado Completo');
              } else if (data.indiceScreen == 2) {
                Navigator.pushNamed(context, ('/movie_favourites'),
                arguments: 'Listado Favoritos');
              }
            }
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME",),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie_creation), label: "CARTELERA"),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: "FAVORITOS")
          ],
        );
      },
    );
  }
}
