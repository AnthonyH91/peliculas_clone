import 'package:flutter/material.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class DrawerMio extends StatelessWidget {
  DrawerMio({Key key}) : super(key: key);

  final _eleccionesDePestana = ['Populares', 'Recientes', 'Proximamente'];

  get eleccionesDePestana => _eleccionesDePestana;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [buildDrawerHeader(context), _lista(context)],
      ),
    );
  }

  UserAccountsDrawerHeader buildDrawerHeader(BuildContext context) {
    return const UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Color.fromARGB(255, 34, 2, 36)),
      accountName: Text('Anthony'),
      accountEmail: Text('anthonyhanono@gmail.com'),
      currentAccountPicture: FlutterLogo(),
    );
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
            style: TextStyle(color: Color.fromARGB(255, 25, 26, 25))),
        trailing: Icon(Icons.navigate_next),
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
