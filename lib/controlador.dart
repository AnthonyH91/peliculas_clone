import 'dart:convert';

import 'package:http/http.dart';
import 'package:peliculas_clone/classes/movie.dart';

import 'package:shared_preferences/shared_preferences.dart';


Future<List<Movie>> getListadoPeliculasPopulares() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String datosAlmacenadosJson;

  try { ///Levanta datos de internet 
    Client http = Client();

    Uri uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1');

    Response response = await http.get(uri);

    prefs.setString('datosInternet',
        response.body); //Guardando de forma local//guarda de forma local
    datosAlmacenadosJson = response.body;
  } catch (e) { /// Levanta informacion local
  
    datosAlmacenadosJson = prefs.getString('datosInternet');
  }

  Map jsonData = jsonDecode(datosAlmacenadosJson);

  List peliculas = jsonData['results'];

  List<Movie> cartelera =
      peliculas.map((movies) => Movie.fromJson(movies)).toList();

  return cartelera;
}

Future<List<Movie>> getListadoPeliculasRecientes() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String datosAlmacenadosJson;

  try { ///Levanta datos de internet 
    Client http = Client();

    Uri uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1');

    Response response = await http.get(uri);

    prefs.setString('datosInternet',
        response.body); //Guardando de forma local//guarda de forma local
    datosAlmacenadosJson = response.body;
  } catch (e) { /// Levanta informacion local
  
    datosAlmacenadosJson = prefs.getString('datosInternet');
  }

  Map jsonData = jsonDecode(datosAlmacenadosJson);

  List peliculas = jsonData['results'];

  List<Movie> cartelera =
      peliculas.map((movies) => Movie.fromJson(movies)).toList();

  return cartelera;
}

Future<List<Movie>> getListadoPeliculasAvances() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String datosAlmacenadosJson;

  try { ///Levanta datos de internet 
    Client http = Client();

    Uri uri = Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1');

    Response response = await http.get(uri);

    prefs.setString('datosInternet',
        response.body); //Guardando de forma local//guarda de forma local
    datosAlmacenadosJson = response.body;
  } catch (e) { /// Levanta informacion local
  
    datosAlmacenadosJson = prefs.getString('datosInternet');
  }

  Map jsonData = jsonDecode(datosAlmacenadosJson);

  List peliculas = jsonData['results'];

  List<Movie> cartelera =
      peliculas.map((movies) => Movie.fromJson(movies)).toList();

  return cartelera;
}

getImage(String urlPoster) {
  return "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + urlPoster;
}
