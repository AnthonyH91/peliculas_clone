
import 'package:flutter/material.dart';


String getImage(String urlPoster) {
  return "https://image.tmdb.org/t/p/w600_and_h900_bestv2/" + urlPoster;
}





class MySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            Navigator.pop(context);
            query = '';
          },
          icon: Icon(Icons.close)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back));
    close(context, '');
  }

  @override
  Widget buildResults(BuildContext context) {
    return showMovies();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return showMovies();
  }

  Widget showMovies() {
    return ListTile(
      title: Text('titulo'),
    );
  }
}
