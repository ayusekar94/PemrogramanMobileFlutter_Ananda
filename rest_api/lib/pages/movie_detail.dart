import 'package:flutter/material.dart';
import 'package:rest_api/models/movie.dart';

class MovieDetail extends StatelessWidget {
  late final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Container(
                padding: EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: Colors.yellow,
                    ),
                    Text(
                      movie.voteAverage.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              Container(
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    "Sinopsis",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
              Container(
                child: Text(movie.overview),
                padding: const EdgeInsets.only(left: 16, right: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}