class Movie {
  final String title;
  final String image;
  final String average;
  final String release;
  final int id;

  Movie({
    this.title,
    this.image,
    this.average,
    this.release,
    this.id,
  });

  factory Movie.fromJson(Map movie) {
    return Movie(
      title: movie["title"],
      image: movie["poster_path"],
      average: movie["vote_average"].toString(),
      release: movie["release_date"].toString(),
      id: movie["id"],
    );
  }
}
