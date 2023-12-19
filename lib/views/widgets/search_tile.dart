import 'package:flutter/material.dart';
import 'package:task/utils/app_constants.dart';

class SearchTile extends StatelessWidget {
  final String name;
  final String genre;
  final String image;
  const SearchTile({
    super.key,
    required this.name,
    required this.genre,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 130,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          vertical: 8,
        ),
        child: Row(
          children: [
            Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        image: NetworkImage(
                            AppContants.BASE_URL + image), //TODO: add image
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(14),
                  ),
                )),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                flex: 6,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        genre,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Container(
                child: Image.asset(
                  "assets/icons/dots.png",
                  width: 24,
                  height: 24,
                  color: Colors.blueAccent,
                ),
              ),
            )
          ],
        ));
  }
}
