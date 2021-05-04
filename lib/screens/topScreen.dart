import 'package:flutter/material.dart';
import 'package:movie_mania/models/movie.dart';
import 'package:movie_mania/screens/detailScreen.dart';

class topWidget extends StatelessWidget {
  final List<Movie> movies;

  topWidget({this.movies});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        final movie = movies[index];

        return ListTile(
          title: InkWell(
            child: Row(
              children: [
                SizedBox(
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                        "https://image.tmdb.org/t/p/w500" + movie.poster_path),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(movie.title),
                        Text(movie.vote_average.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            onTap: () =>
                Navigator.push(context, MaterialPageRoute(builder: (context) {
              return new detailWidget(
                movie: movie,
              );
            })),
          ),
        );
      },
    );
  }
}
