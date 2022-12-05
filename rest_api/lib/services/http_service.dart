import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/movie.dart';

class HttpService {
  final String apiKey = '1e14fe7bc38bf1a9dcea3ea586570541';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      // String response = result.body;
      // return response;
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List? movies = (moviesMap?.map((i) => Movie.fromJson(i)).toList());
      return movies;
    } else {
      print("Gagal");
      return null;
    }
  }
}