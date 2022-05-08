
import 'package:flutter/material.dart';


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
