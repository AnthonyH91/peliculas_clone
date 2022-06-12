import 'package:flutter/material.dart';
import 'package:peliculas_clone/mis_colores.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class DrawerMio extends StatelessWidget {
  DrawerMio({Key key}) : super(key: key);

  final _eleccionesDePestana = ['Populares', 'Recientes', 'Proximamente'];

  get eleccionesDePestana => _eleccionesDePestana;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: MyColors.colorQuinto,
      child: Column(
        children: [buildDrawerHeader(context), _lista(context)],
      ),
    );
  }

  UserAccountsDrawerHeader buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: MyColors.colorSegundo),
      accountName: const Text('Anthony Hanono', style: TextStyle(fontSize: 24,)),
      accountEmail: const Text('anthonyhanono@gmail.com', style: TextStyle(fontSize: 16,)),
      currentAccountPicture: CircleAvatar(
        backgroundColor: MyColors.colorTercero,backgroundImage: const AssetImage('assets/iconapp.png'),),);
  }

  Widget _lista(context) {
    return Flexible(
      child: ListView(
        children: _crearItems(context),
      ),
    );
  }

  List<Widget> _crearItems(context) {
    List<ListTile> widgets = _eleccionesDePestana.map((itemElegido) {
      return ListTile(
        title: Text(itemElegido,
            style: TextStyle(color: MyColors.colorCuarto,fontSize: 22,)),
        trailing: const Icon(Icons.navigate_next),
        onTap: () {
          /// Provider.of<JugadorProvider>(context, listen: false).obtenerUsuarios();
          /// si quiero hacer una pantalla individual o generica uso esa direccion ('/movie_$item')
          /// Navigator.pushNamed(context, ('/movie_$item')  ,arguments: item);

          Provider.of<MoviesProvider>(context, listen: false)
              .getListadoPeliculas(itemElegido);

          

          Navigator.pushNamed(context, ('/movie_generic'),
              arguments: itemElegido);
        },
      );
    }).toList();

    return widgets;
  }
}
