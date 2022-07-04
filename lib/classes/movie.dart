class Movie {
  late final String title;
  late final String image;
  late final String average;
  late final String release;
  late final String id;
  late final String overview;


  Movie({
    required this.title,
    required this.image,
    required this.average,
    required this.release,
    required this.id,
    required this.overview,
  });

  factory Movie.fromJson(Map movie) {
    return Movie(
      title: movie["title"],
      image: movie["poster_path"],
      average: movie["vote_average"].toString(),
      release: movie["release_date"].toString(),
      id: movie["id"].toString(),
      overview: movie["overview"].toString(),
    );
  }
}
