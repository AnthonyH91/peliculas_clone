import 'package:flutter/material.dart';

class BottomNavBarMio extends StatefulWidget {
  BottomNavBarMio({Key key}) : super(key: key);

  @override
  State<BottomNavBarMio> createState() => _BottomNavBarMioState();
}

class _BottomNavBarMioState extends State<BottomNavBarMio> {
  int _paginaSeleccionada = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _paginaSeleccionada = index;
        });
      },
      currentIndex: _paginaSeleccionada,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
        BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation), label: "CARTELERA"),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: "FAVORITOS")
      ],
    );
  }
}
