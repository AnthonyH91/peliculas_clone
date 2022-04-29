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
    return UserAccountsDrawerHeader(
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
String _urlDelServicioSolicitado;


    var widgets = _eleccionesDePestana.map((item) {
      return ListTile(
        title: Text(item,
            style: TextStyle(color: Color.fromARGB(255, 25, 26, 25))),
        trailing: Icon(Icons.navigate_next),
        onTap: () {
          /// Provider.of<JugadorProvider>(context, listen: false).obtenerUsuarios();
          /// si quiero hacer una pantalla individual o generica uso esa direccion ('/movie_$item')
          /// Navigator.pushNamed(context, ('/movie_$item')  ,arguments: item);

          if (item == 'Populares' || item == 'Recientes') {
            if (item == 'Populares') {
              _urlDelServicioSolicitado =
                  'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1';
            } else {
              _urlDelServicioSolicitado =
                  'https://api.themoviedb.org/3/movie/now_playing?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1';
            }
          } else {
            _urlDelServicioSolicitado =
                'https://api.themoviedb.org/3/movie/upcoming?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1';
          }

          Provider.of<MoviesProvider>(context, listen: false)
              .getListadoPeliculas(_urlDelServicioSolicitado);
          Navigator.pushNamed(context, ('/movie_generic'), arguments: item);
        },
      );
    }).toList();

    return widgets;
  }
}
