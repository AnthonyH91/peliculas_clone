import 'package:flutter/material.dart';

class Bottom_nav_bar_Mio extends StatefulWidget {
  Bottom_nav_bar_Mio({Key key}) : super(key: key);

  @override
  State<Bottom_nav_bar_Mio> createState() => _Bottom_nav_bar_MioState();
}

class _Bottom_nav_bar_MioState extends State<Bottom_nav_bar_Mio> {
int _paginaSeleccionada = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _paginaSeleccionada=index;
        });
        
      },
          currentIndex: _paginaSeleccionada,
        items: const
        [
         BottomNavigationBarItem(icon: Icon(Icons.movie_creation),label: "CARTELERA"),
         BottomNavigationBarItem(icon: Icon(Icons.home),label: "HOME"),
         BottomNavigationBarItem(icon: Icon(Icons.star),label: "FAVORITOS")
        ],
        );
  }
}