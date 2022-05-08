import 'package:flutter/material.dart';
import 'package:peliculas_clone/home_page.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:peliculas_clone/screens/movie_details.dart';
import 'package:peliculas_clone/screens/movie_favourites.dart';
import 'package:peliculas_clone/screens/movie_generic.dart';
import 'package:provider/provider.dart';

//import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// creo la instancia que emite el estado
/*MultiProvider(
      providers: [
        ChangeNotifierProvider<ChatProvider>( create: (context) => ChatProvider()),
        ChangeNotifierProvider<MessageProvider>( create: (context) => MessageProvider()),
      ],*/
      
    return ChangeNotifierProvider(
      create: (BuildContext context) => MoviesProvider() ,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          //Armo las rutas
          initialRoute: '/',
          routes: {
            '/': (context) => HomePage(),
            '/movie_generic': (context) => MoviesGenerics(),
            '/movie_details': (context) => MoviesDetails(),
            '/movie_favourites':(context) => MovieFavourites(),
    
          }),
    );
  }
}
