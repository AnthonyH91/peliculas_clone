//import 'package:gmaj_test_app/crear_listado_de_usuarios.dart';
//import 'package:gmaj_test_app/models/user.dart';

/*import 'package:flutter/material.dart';

class search_Mio extends SearchDelegate<String> {
  List<String> listaPalabrasBusqueda = [
    'Anana',
    'Banana',
    'Cereza',
    'Durazno',
    'Etrog',
    'Frutilla',
    'Granada',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [IconButton(icon: const Icon(Icons.clear),
                      onPressed: () {query = '';
                      } ,)];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: 
                      const Icon(Icons.arrow_back),
                      onPressed: () {
                        close(context, null);

                      } ,);
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> palabraIngresada = [];
    for (var palabra in listaPalabrasBusqueda){
      if (palabra.toLowerCase().contains(query.toLowerCase())){
        palabraIngresada.add(palabra);
      }
    }
    return ListView.builder(
      itemCount: palabraIngresada.length,
      itemBuilder: (BuildContext context, int index) {
        var result = palabraIngresada[index];
        return ListTile(title: Text(result),);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

  }
}
*/