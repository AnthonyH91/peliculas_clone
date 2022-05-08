class Movie {
  final String title;
  final String image;
  final String average;
  final String release;
  final String id;
  final String overview;


    /*  "backdrop_path": "/egoyMDLqCxzjnSrWOz50uLlJWmD.jpg",

      "overview": "After settling in Green Hills, Sonic is eager to prove he has what it takes to be a true hero. His test comes when Dr. Robotnik returns, this time with a new partner, Knuckles, in search for an emerald that has the power to destroy civilizations. Sonic teams up with his own sidekick, Tails, and together they embark on a globe-trotting journey to find the emerald before it falls into the wrong hands.",
      "popularity": 7239.369,
      "poster_path": "/6DrHO1jr3qVrViUO6s6kFiAGM7.jpg",
      "release_date": "2022-03-30",
      "title": "Sonic the Hedgehog 2",

      "vote_average": 7.7,
      "vote_count": 958*/



  Movie({
    this.title,
    this.image,
    this.average,
    this.release,
    this.id,
    this.overview,
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
