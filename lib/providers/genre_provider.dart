import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:peliculas_clone/classes/genres.dart';

import 'package:shared_preferences/shared_preferences.dart';

class GenreProvider extends ChangeNotifier {
  final List<Genre> _generos = [];
        List<Genre> get genres => _generos;

        String _urlDelServicioSolicitado;

  Future getListadogeneros(urlRecibida) async {

    _urlDelServicioSolicitado = urlRecibida;


    SharedPreferences prefs = await SharedPreferences.getInstance();

    String datosAlmacenadosJson;

    try {
      ///Levanta datos de internet
      Client http = Client();

      Uri uri = Uri.parse(_urlDelServicioSolicitado);

      Response response = await http.get(uri);

      prefs.setString('datosInternetGeneros',
          response.body); //Guardando de forma local//guarda de forma local
      datosAlmacenadosJson = response.body;
    } catch (e) {
      /// Levanta informacion local

      datosAlmacenadosJson = prefs.getString('datosInternetGeneros');
    }

    Map jsonData = jsonDecode(datosAlmacenadosJson);

    List generos = jsonData['genres'];

    List<Genre> listadoGeneros =
        generos.map((generos) => Genre.fromJson(generos)).toList();

// inyecto el listado de peliculas al provider

    _generos.clear();
    _generos.addAll(listadoGeneros);
    notifyListeners();
  }


}