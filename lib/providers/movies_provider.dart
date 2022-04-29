import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesProvider extends ChangeNotifier {
  final List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  Future getListadoPeliculas(urlDelServicio) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String datosAlmacenadosJson;

    try {
      ///Levanta datos de internet
      Client http = Client();

      Uri uri = Uri.parse(urlDelServicio);

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

    _movies.clear();
    _movies.addAll(cartelera);
    notifyListeners();
  }
  
}
