//https://api.themoviedb.org/3/genre/movie/list?api_key=0e685fd77fb3d76874a3ac26e0db8a4b&language=en-US&page

class Genre {
  final String nameGenre;
  final String id;

  Genre({
    this.nameGenre,
    this.id,
  });

  factory Genre.fromJson(Map genero) {
    return Genre(
      nameGenre: genero["name"],
      id: genero["id"].toString(),
    );
  }
}


