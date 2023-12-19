import 'dart:convert';

import 'package:task/data/model/movie.dart';
import 'package:http/http.dart' as http;
import 'package:task/utils/app_constants.dart';

class MovieRepo {
  Future<List<Movie>> getMovies() async {
    var response = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1"),
        headers: {"authorization": "Bearer ${AppContants.API_TOKEN}"});
    if (response.statusCode == 200) {
      var resp = response.body;
      var data = jsonDecode(resp)["results"];
      List<Movie> movies = [];
      for (var item in data) {
        movies.add(Movie.fromJson(item));
      }
      return movies;
    } else {
      throw Exception("Error getting movies");
    }
  }
}
