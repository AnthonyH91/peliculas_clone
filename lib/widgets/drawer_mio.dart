// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:peliculas_clone/screens/movies_pop.dart';
import 'package:peliculas_clone/screens/movies_recent.dart';
import 'package:peliculas_clone/screens/movies_trailers.dart';


class drawer_mio extends StatelessWidget {
  const drawer_mio({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.red),
      child: Drawer(
          child: ListView(
        children: [
          buildDrawerHeader(context),
          ListTile(
            title: Text('PELICULAS POPULARES'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              /*Provider.of<JugadorProvider>(context, listen: false)
                  .obtenerUsuarios();
              Navigator.pushNamed(context, '/paginafutbol');*/
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Movies_Pop()),
              );
            },
          ),
          ListTile(
            title: Text('PELICULAS RECIENTES'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {/*
              Provider.of<JugadorProvider>(context, listen: false)
                  .obtenerUsuarios();
              Navigator.pushNamed(context, '/paginabasket');*/

              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Movies_Recent()),
              );
            },
          ),
          ListTile(
            title: Text('PROXIMAMENTE EN CARTELERA'),
            trailing: Icon(Icons.navigate_next),
            onTap: () {
              /*Provider.of<JugadorProvider>(context, listen: false)
                  .obtenerUsuarios();
              Navigator.pushNamed(context, '/paginafavoritos');*/
              Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => Movies_Trailers()),
              );
            },
          ),
        ],
      )),
    );
  }

  UserAccountsDrawerHeader buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(color: Color.fromARGB(255, 189, 5, 5)),
      accountName: Text('Anthony'),
      accountEmail: Text('anthonyhanono@gmail.com'),
      currentAccountPicture: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 255, 89, 241),
        /*backgroundImage: AssetImage(
          'assets/iconApp.png',
        ),*/
      ),
    );
  }
}