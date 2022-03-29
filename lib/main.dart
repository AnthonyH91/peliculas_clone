import 'package:flutter/material.dart';
import 'package:peliculas_clone/widgets/bottom_nav_bar_mio.dart';
import 'package:peliculas_clone/widgets/chip_mio.dart';
import 'package:peliculas_clone/widgets/drawer_mio.dart';
import 'package:peliculas_clone/widgets/listview_mio.dart';
//import 'package:peliculas_clone/widgets/search_mio.dart';
import 'package:peliculas_clone/widgets/swiper_mio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
          bottomNavigationBar: Bottom_nav_bar_Mio(),
          drawer: const drawer_mio(),
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.casino_rounded),
                tooltip: 'Azar',
              ),
              IconButton(
                onPressed: () {
                  /*showSearch<String>(
                    context: context,
                    delegate: search_Mio(),
                  );*/
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
          body: ListView(
            children: <Widget>[
              Divider(thickness: 10.0, color: Colors.red),
              swiper_Mio(),
              Divider(thickness: 10.0, color: Colors.red),
              Row(
                children: [
                  Chip_Mio(),
                  Chip_Mio(),
                  Chip_Mio(),
                  Chip_Mio(),
                ],
              ),
              Divider(thickness: 10.0, color: Colors.red),
              SizedBox(
                child: ListViewBuilder(),
                height: 350,
              ),
            ],
          ),
        ));
  }
}
