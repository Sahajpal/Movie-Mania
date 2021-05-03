import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movie_mania/models/movie.dart';
import 'package:movie_mania/widgets/topWidget.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<App> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _populateTopMovies();
  }

  void _populateTopMovies() async {
    final movies = await _fetchTopMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movie>> _fetchTopMovies() async {
    String url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=4d317486a1409c2f941880e08678affa";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["results"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to load movies!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Mania',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Top Rated Movies"),
        ),
        body: topWidget(movies: _movies),
      ),
    );
  }
}
