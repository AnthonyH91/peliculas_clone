import 'package:flutter/material.dart';
import 'package:peliculas_clone/home_page.dart';
import 'package:peliculas_clone/screens/movie_details.dart';
//import 'package:provider/provider.dart';

// obtiene peliculas populares https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1
// obtiene peliculas futuras https://api.themoviedb.org/3/movie/upcoming?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1
// obtiene peliculas recientes https://api.themoviedb.org/3/movie/now_playing?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        
        initialRoute: '/',
        routes: {
          '/': (context) => HomePage(),
          '/movie_details': (context) => MoviesDetails(),
        });
  }
}
