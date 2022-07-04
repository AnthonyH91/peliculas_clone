//https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page

class Genre {
  late final String nameGenre;
  late final String id;

  Genre({
    required this.nameGenre,
    required this.id,
  });

  factory Genre.fromJson(Map genero) {
    return Genre(
      nameGenre: genero["name"],
      id: genero["id"].toString(),
    );
  }
}


