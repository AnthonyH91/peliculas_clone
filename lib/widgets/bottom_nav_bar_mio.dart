import 'package:flutter/material.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class BottomNavBarMio extends StatefulWidget {
  const BottomNavBarMio({Key key}) : super(key: key);

  @override
  State<BottomNavBarMio> createState() => _BottomNavBarMioState();
}

class _BottomNavBarMioState extends State<BottomNavBarMio> {
  final List<String> _listaDirecciones = ['Populares','Recientes','Proximamente',
    
  ];


  get listaDirecciones => _listaDirecciones;

  int _paginaSeleccionada = 0;

  get paginaSeleccionada => _paginaSeleccionada;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _paginaSeleccionada = index;

          if (_paginaSeleccionada == 2) {
            Navigator.pushNamed(context, ('/movie_favourites'));
          }
          if (_paginaSeleccionada == 1) {
            /*for (int i = 0; i < _listaDirecciones.length ; i++) {

              Provider.of<MoviesProvider>(context, listen: false)
              .getListadoPeliculasTotal(_listaDirecciones[i]);

            }*/
            Navigator.pushNamed(context, ('/movie_totals'),
              arguments: 'Listado Completo');
          }
        });
      },
      currentIndex: _paginaSeleccionada,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "HOME",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation), label: "CARTELERA"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "FAVORITOS")
      ],
    );
  }
}
