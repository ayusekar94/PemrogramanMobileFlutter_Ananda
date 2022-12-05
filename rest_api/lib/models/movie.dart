class Movie {
  late final int id;
  late final String title, overview, posterPath;
  late final double voteAverage;

  Movie(this.id, this.title, this.voteAverage, this.overview, this.posterPath);

  Movie.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    voteAverage = parsedJson['vote_average'] * 1.0;
    overview = parsedJson['overview'];
    posterPath = parsedJson['poster_path'];
  }
}