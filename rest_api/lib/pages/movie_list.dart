import 'package:flutter/material.dart';
import 'package:rest_api/services/http_service.dart';
import 'package:rest_api/pages/movie_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int moviesCount = 0;
  List? movies;
  late HttpService service;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  Future initialize() async {
    movies = [];
    movies = await service.getPopularMovies();
    setState(() {
      // moviesCount = movies.length;
      moviesCount = movies?.length ?? 0;
      // print(moviesCount);
      movies = movies;
    });
  }

  @override
  void initState() {
    service = HttpService();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
        ),
        body: ListView.builder(
          itemCount: (this.moviesCount == null) ? 0 : this.moviesCount,
          itemBuilder: (context, int position) {
            return Card(
              color: Colors.white,
              elevation : 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(this.imgPath + movies![position].posterPath),
                   
                ),
                title: Text(movies![position].title),
                subtitle: Text(
                  "Rating = " + movies![position].voteAverage.toString(), 
                ),
                onTap: (){
                  MaterialPageRoute route = MaterialPageRoute(
                    builder: (_) => MovieDetail(movies![position]));
                    Navigator.push(context , route);
                },
              ),
            );
          }),
    );
  }
}

// class _MovieListState extends State<MovieList> {
//   String result = "";
//   late HttpService service;

//   @override
//   Widget build(BuildContext context) {
//     service.getPopularMovies().then((value) => {
//       setState(() {
//         result = value!;
//       })
//     });
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Popular Movies"),
//       ),
//       body: Container(
//         child: Text(result),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     service = HttpService();
//     super.initState();
//   }
// }