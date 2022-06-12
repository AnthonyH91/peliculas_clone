import 'package:flutter/material.dart';
import 'package:peliculas_clone/classes/movie.dart';
import 'package:peliculas_clone/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MySearchDelegate extends SearchDelegate {
  List<Movie> _listado = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
        itemCount: _listado.length,
        itemBuilder: (_, index) {
          return ListTile(
            title: Text(_listado[index].title),
            leading: FadeInImage.assetNetwork(
              image: getImage(_listado[index].image),
              placeholder: "assets/Cube.gif",
              imageCacheWidth: 50,
              width: 50,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/movie_details',
                arguments: _listado[index],
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Consumer<MoviesProvider>(builder: (BuildContext context, data, _) {
      _listado = data.allMovies.where((element) {
        return element.title.toLowerCase().contains(query.trim().toLowerCase());
      }).toList();
      _listado.sort(
        (pelicula1, pelicula2) => pelicula1.title.compareTo(pelicula2.title),
      );
      return ListView.builder(
          itemCount: _listado.length,
          itemBuilder: (_, index) {
            return ListTile(
              title: Text(_listado[index].title),
              leading: FadeInImage.assetNetwork(
                image: getImage(_listado[index].image),
                placeholder: "assets/Cube.gif",
                imageCacheWidth: 50,
                width: 50,
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/movie_details',
                  arguments: _listado[index],
                );
              },
            );
          });
    });
  }

  Widget showMovies() {
    return const ListTile(
      title: Text('titulo'),
    );
  }
}
