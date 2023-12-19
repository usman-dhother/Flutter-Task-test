import 'package:flutter/material.dart';
import 'package:task/data/model/movie.dart';
import 'package:task/data/repository/movie_repo.dart';

class MovieProvider extends ChangeNotifier {
  List<Movie> _movies = [];
  String _searchText = "";

  List<Movie> get movies => _movies;
  String get searchText => _searchText;

  void setMovies() async {
    _movies = await MovieRepo().getMovies();
    notifyListeners();
  }

  set searchText(String value) {
    _searchText = value;
    notifyListeners();
  }
}
