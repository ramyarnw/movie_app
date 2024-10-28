import 'package:flutter/material.dart';

import '../screens/movie_detail_screen.dart';

class MovieComponent extends StatefulWidget {
  const MovieComponent({
    super.key,
    required this.movieTitle,
    required this.imageURL,
  });

  final String movieTitle;
  final String imageURL;

  @override
  State<MovieComponent> createState() => _MovieComponentState();
}

class _MovieComponentState extends State<MovieComponent> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return const MovieDetailScreen();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
        child: Column(
          children: [
            Image.network(widget.imageURL),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.movieTitle,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

/* DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image:  NetworkImage(widget.imageURL), fit: BoxFit.fitHeight),
              ),
            ),

            Flexible(
              child: Container(
                color: Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 6,
                    ),*/
