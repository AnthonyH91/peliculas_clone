import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesProvider extends ChangeNotifier {
  final List<Movie> _movies = [];
  List<Movie> get movies => _movies;

  final List<Movie> _allMovies = [];
  List<Movie> get allMovies => _allMovies;

  MoviesProvider.init() {
    cargarListadoFavoritosDesdePreferencias();
  }

  final List<String> _listadoPeliculaFavoritos = [];
  List<String> get listadoPeliculaFavoritos => _listadoPeliculaFavoritos;

  String _urlDelServicioSolicitado = '';
  String _urlDelServicioSolicitado2 = '';

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

      prefs.setString('$itemParaValidarUrl',
          response.body); //Guardando de forma local//guarda de forma local
      datosAlmacenadosJson = response.body;
    } catch (e) {
      /// Levanta informacion local

      datosAlmacenadosJson = prefs.getString('$itemParaValidarUrl');
    }

    Map jsonData = jsonDecode(datosAlmacenadosJson);

    List peliculas = jsonData['results'];

    List<Movie> cartelera =
        peliculas.map((movies) => Movie.fromJson(movies)).toList();

// inyecto el listado de peliculas al provider

    _movies.clear();

    ///error con la lista , hay que separar provider por categoria una variable
    _movies.addAll(cartelera);
    notifyListeners();
  }

  agregarEliminarPeliculaFavoritos(context, String idPelicula) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (_listadoPeliculaFavoritos.contains(idPelicula) == true) {
      _listadoPeliculaFavoritos.remove(idPelicula);
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          duration: const Duration(seconds: 5),
          content: const Text('ELIMINADA DE FAVORITOS'),
          action: SnackBarAction(
              label: 'Ver listado',
              onPressed: () {
                Navigator.pushNamed(context, ('/movie_favourites'),
                    arguments: 'Listado Favoritos');
                    actualizarIndice(2);
              }),
        ));
    } else {
      _listadoPeliculaFavoritos.add(idPelicula);
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(SnackBar(
          duration: const Duration(seconds: 5),
          content: const Text('AGREGADA A FAVORITOS'),
          action: SnackBarAction(
              label: 'Ver listado',
              onPressed: () {
                Navigator.pushNamed(context, ('/movie_favourites'),
                    arguments: 'Listado Favoritos');
                    actualizarIndice(2);
              }),
        ));
    }

    await prefs.setStringList('listadoFavoritos', _listadoPeliculaFavoritos);
    //print(_listadoPeliculaFavoritos);
    notifyListeners();
  }

  cargarListadoFavoritosDesdePreferencias() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<String> listado = prefs.getStringList('listadoFavoritos');
    _listadoPeliculaFavoritos.addAll(listado);
  }

  Future getListadoPeliculasTotal(String itemParaValidarUrl2) async {
    _allMovies.clear();
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String datosAlmacenadosJson;

    if (itemParaValidarUrl2 == 'Populares' ||
        itemParaValidarUrl2 == 'Recientes') {
      if (itemParaValidarUrl2 == 'Populares') {
        _urlDelServicioSolicitado2 =
            'https://api.themoviedb.org/3/movie/popular?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1';
      } else {
        _urlDelServicioSolicitado2 =
            'https://api.themoviedb.org/3/movie/now_playing?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1';
      }
    } else {
      _urlDelServicioSolicitado2 =
          'https://api.themoviedb.org/3/movie/upcoming?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page=1';
    }

    try {
      ///Levanta datos de internet
      Client http = Client();

      Uri uri = Uri.parse(_urlDelServicioSolicitado2);

      Response response = await http.get(uri);

      prefs.setString('carteleraTotal$itemParaValidarUrl2',
          response.body); //Guardando de forma local//guarda de forma local
      datosAlmacenadosJson = response.body;
    } catch (e) {
      /// Levanta informacion local

      datosAlmacenadosJson =
          prefs.getString('carteleraTotal$itemParaValidarUrl2');
    }

    Map jsonData = jsonDecode(datosAlmacenadosJson);

    List peliculas = jsonData['results'];

    List<Movie> cartelera =
        peliculas.map((movies) => Movie.fromJson(movies)).toList();

// inyecto el listado de peliculas al provider
    _allMovies.addAll(cartelera);

    var seen = <String>{};
    List<Movie> uniquelist =
        _allMovies.where((pelicula) => seen.add(pelicula.id)).toList();

    _allMovies.clear();

    _allMovies.addAll(uniquelist);

    notifyListeners();
  }

  int _indiceScreen = 0;
  get indiceScreen => _indiceScreen;

  actualizarIndice(int valor) {
    _indiceScreen = valor;

    notifyListeners();
  }
}

String getImage(String urlPoster) {
  return "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + urlPoster;
}
