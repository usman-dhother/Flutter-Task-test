import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/movie_provider.dart';
import 'package:task/views/pages/movie_detail.dart';
import 'package:task/views/widgets/movie_display.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({super.key});

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<MovieProvider>(context, listen: false).setMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (c, v, child) => Scaffold(
        backgroundColor: Color(0xffD8D8DF),
        body: v.movies.length > 0
            ? ListView.builder(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MovieDetail(
                                    movie: v.movies[index],
                                  )));
                    },
                    child: MainMovieTile(
                        title: v.movies[index].title!,
                        image: v.movies[index].posterPath!),
                  );
                },
                itemCount: v.movies.length)
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
