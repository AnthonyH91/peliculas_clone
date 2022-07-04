import 'package:flutter/material.dart';
import 'package:peliculas_clone/home_page.dart';
import 'package:peliculas_clone/providers/genre_provider.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:peliculas_clone/screens/movie_details.dart';
import 'package:peliculas_clone/screens/movie_favourites.dart';
import 'package:peliculas_clone/screens/movie_generic.dart';
import 'package:peliculas_clone/screens/movie_totals.dart';
import 'package:provider/provider.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// creo la instancia que emite el estado
      
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MoviesProvider>( create: (context) => MoviesProvider.init()),
        ChangeNotifierProvider<GenreProvider>( create: (context) => GenreProvider()),
      ],
      
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Material App',
          //Armo las rutas
          initialRoute: '/',
          routes: {
            '/': (context) => const HomePage(),
            '/movie_generic': (context) => const MoviesGenerics(),
            '/movie_totals': (context) => const MoviesTotals(),
            '/movie_details': (context) => const MoviesDetails(),
            '/movie_favourites':(context) => const MovieFavourites(),
    
          }),
    );
  }
}
