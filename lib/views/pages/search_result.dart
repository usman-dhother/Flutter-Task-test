import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/data/model/movie.dart';
import 'package:task/provider/movie_provider.dart';
import 'package:task/views/widgets/search_tile.dart';

import 'movie_detail.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  List<Movie> searched = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searched = Provider.of<MovieProvider>(context, listen: false)
        .movies
        .where((element) => element.title!.toLowerCase().contains(
            Provider.of<MovieProvider>(context, listen: false)
                .searchText
                .toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(builder: (c, m, child) {
      searched = Provider.of<MovieProvider>(context)
          .movies
          .where((element) => element.title!.toLowerCase().contains(
              Provider.of<MovieProvider>(context).searchText.toLowerCase()))
          .toList();
      return Scaffold(
        backgroundColor: Color(0xffD8D8DF),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Top Result",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 50,
                ),
                ListView.builder(
                  itemCount: searched.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetail(
                                  movie: searched[index],
                                )));
                      },
                      child: SearchTile(
                          name: searched[index].title!,
                          genre: "Movie Genre",
                          image: searched[index].posterPath!),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
