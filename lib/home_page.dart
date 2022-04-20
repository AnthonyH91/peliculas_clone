import 'package:flutter/material.dart';
import 'package:peliculas_clone/widgets/bottom_nav_bar_mio.dart';
import 'package:peliculas_clone/widgets/drawer_mio.dart';
import 'package:peliculas_clone/widgets/listview_mio.dart';
import 'package:peliculas_clone/widgets/row_chip_mio.dart';
import 'package:peliculas_clone/widgets/swiper_mio.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavBarMio(),
          drawer: const DrawerMio(),
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.casino_rounded),
                tooltip: 'Azar',
              ),
              IconButton(
                onPressed: () {},
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
              const Divider(thickness: 10.0, color: Colors.red),
              SwiperMio(),
              const Divider(thickness: 10.0, color: Colors.red),
              RowMio(),
              const Divider(thickness: 10.0, color: Colors.red),
              const SizedBox(
                child: ListViewBuilder(),
                height: 350,
              ),
            ],
          )),
    );
  }
}
