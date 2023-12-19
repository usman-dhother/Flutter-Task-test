import 'package:flutter/material.dart';
import 'package:task/utils/app_constants.dart';

class MainMovieTile extends StatelessWidget {
  final String title;
  final String image;
  const MainMovieTile({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      child: Container(
        height: 250,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey,
          image: DecorationImage(
              image: NetworkImage(
                  "${AppContants.BASE_URL}$image"), //TODO: add image
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                title,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
