import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesProvider extends ChangeNotifier {
  final List<Movie> _movies = [];
        List<Movie> get movies => _movies;

  final List<String> _listadoPeliculaFavoritos = [];
  List<String> get listadoPeliculaFavoritos => _listadoPeliculaFavoritos;

        String _urlDelServicioSolicitado;

  Future getListadoPeliculas(itemParaValidarUrl) async {
    if (itemParaValidarUrl == 'Populares' ||
        itemParaValidarUrl == 'Recientes') {
      if (itemParaValidarUrl == 'Populares') {
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

    SharedPreferences prefs = await SharedPreferences.getInstance();

    String datosAlmacenadosJson;

    try {
      ///Levanta datos de internet
      Client http = Client();

      Uri uri = Uri.parse(_urlDelServicioSolicitado);

      Response response = await http.get(uri);

      prefs.setString('datosInternet',
          response.body); //Guardando de forma local//guarda de forma local
      datosAlmacenadosJson = response.body;
    } catch (e) {
      /// Levanta informacion local

      datosAlmacenadosJson = prefs.getString('datosInternet');
    }

    Map jsonData = jsonDecode(datosAlmacenadosJson);

    List peliculas = jsonData['results'];

    List<Movie> cartelera =
        peliculas.map((movies) => Movie.fromJson(movies)).toList();

// inyecto el listado de peliculas al provider

    _movies.clear(); ///error con la lista , hay que separar provider por categoria una variable
    _movies.addAll(cartelera);
    notifyListeners();
  }

agregarEliminarPeliculaFavoritos(String idPelicula) {
    if (_listadoPeliculaFavoritos.contains(idPelicula) == true) {
      _listadoPeliculaFavoritos.remove(idPelicula);
    } else {
      _listadoPeliculaFavoritos.add(idPelicula);
    }
    notifyListeners();
  }



}


String getImage(String urlPoster) {
  return "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + urlPoster;
}