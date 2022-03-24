// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:peliculas_clone/widgets/drawer_mio.dart';
import 'package:peliculas_clone/widgets/listview_mio.dart';
import 'package:peliculas_clone/widgets/swiper_mio.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(items: 
        [BottomNavigationBarItem(icon: Icon(Icons.done),label: "VISTOS"),
        BottomNavigationBarItem(icon: Icon(Icons.movie_creation),label: "CARTELERA"),
        BottomNavigationBarItem(icon: Icon(Icons.star),label: "FAVORITOS")
        ],),
        drawer: Drawer_mio(),
        appBar: AppBar(backgroundColor: Colors.redAccent,actions: [IconButton(onPressed: (){}, icon: Icon(Icons.access_alarms)),IconButton(onPressed: (){}, icon: Icon(Icons.adb_sharp))],
         
          title: Text('MOVIES APP'),
        ),
        body: ListView(
              children: <Widget> [
              Divider(thickness: 10.0,color: Colors.red),
              swiper_Mio(),
              Divider(thickness: 10.0,color: Colors.red),
              SizedBox(
              child: ListViewBuilder(),
              height: 390,),
          ],
            
          ),
          

          
        )
        );
      
  }

  

}