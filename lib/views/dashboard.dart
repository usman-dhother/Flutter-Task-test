import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/movie_provider.dart';
import 'package:task/views/pages/search_result.dart';
import 'package:task/views/pages/searchpage.dart';
import 'package:task/views/pages/watch_page.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List screens = [
    Scaffold(),
    WatchPage(),
    Scaffold(),
    Scaffold(),
  ];
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();
  String searchText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isSearching
            ? Consumer<MovieProvider>(builder: (context, m, c) {
                return TextFormField(
                  controller: searchController,
                  onChanged: (value) {
                    m.searchText = value;
                  },
                  decoration: InputDecoration(
                    hintText: "TV Show, Movies, and more",
                    hintStyle: TextStyle(
                      color: const Color.fromARGB(255, 114, 113, 113),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    fillColor: Color(0xffD8D8DF),
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Image.asset(
                      "assets/icons/Search.png",
                      width: 24,
                      height: 24,
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isSearching = false;
                        });
                      },
                      child: Image.asset(
                        "assets/icons/Close.png",
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                );
              })
            : const Text('Watch'),
        centerTitle: false,
        actions: !isSearching
            ? [
                InkWell(
                    onTap: () {
                      setState(() {
                        isSearching = true;
                      });
                    },
                    child: Image.asset("assets/icons/Search.png",
                        width: 24, height: 24)),
                SizedBox(width: 16),
              ]
            : [],
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home,
          Icons.play_arrow,
          Icons.library_books,
          Icons.more_horiz,
        ],
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        activeIndex: 1,
        leftCornerRadius: 28,
        rightCornerRadius: 28,
        gapLocation: GapLocation.none,
        notchSmoothness: NotchSmoothness.softEdge,
        backgroundColor: Color(0xff2E2739),
        onTap: (index) {},
      ),
      body: isSearching && !(context.watch<MovieProvider>().searchText == "")
          ? SearchResult()
          : isSearching
              ? SearchPage()
              : screens[1],
    );
  }
}

