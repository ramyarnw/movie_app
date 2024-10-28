import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

import '../components/movie_detail_component.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {

  List casts = [
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
    'assets/molly_ringwald.png',
  ];
  List castName = [
    'Molly',
    'Molly',
    'Molly',
    'Molly',
    'Molly',
    'Molly',
    'Molly',
    'Molly',
    'Molly',
    'Molly',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 300,
        flexibleSpace: const Image(
          image: AssetImage(
            'assets/first_movie.jpg',
          ),
          fit: BoxFit.fill,
        ),
        title: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Book Ticket'),
                  ),
                ),
                Row(
                  children: [
                    FilledButton(
                      onPressed: () {},
                      child: const Text('23-5-2024'),
                    ),
                    FilledButton(
                      onPressed: () {},
                      child: const Text('8.5'),
                    ),
                  ],
                ),
                const Text(
                  'THE BREAKFAST CLUB',
                  style: TextStyle(fontSize: 20, color: Colors.red),
                )
                //backgroundColor: Theme.of(context).shadowColor,
              ],
            )
          ],
        ),
      ),
      body: Column(
        children: [
          const Text(
            'SYNOPSIS',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          const Text(
            'The Breakfast Club is a 1985 American coming-of-age comedy-drama film about five high school students who spend a Saturday in detention together .',
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
          const Text(
            'Cast',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: casts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final cast = casts[index];
                  final name = castName[index];
                  return CastComponent(
                   castName: name,
                    imageURL: cast,
                  );
                }),
          ),
          const Text(
            'ABOUT',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          Column(
            children: [
              Row(
                children: [
                  const Text('adult - '),
                  Text(Movie().adult.toString())
                ],
              ),
              Row(
                children: [
                  const Text('backdrop_path - '),
                  Text(Movie().backdropPath),
                ],
              ),
              Row(
                children: [
                  const Text('genre_ids - '),
                  Text(Movie().genreIds.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('id - '),
                  Text(Movie().id.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('original_language - '),
                  Text(Movie().originalLanguage)
                ],
              ),
              Row(
                children: [
                  const Text('original_title - '),
                  Text(Movie().originalTitle),
                ],
              ),
              Row(
                children: [
                  const Text('overview - '),
                  Text(Movie().overview),
                ],
              ),
              Row(
                children: [
                  const Text('popularity - '),
                  Text(Movie().popularity),
                ],
              ),
              Row(
                children: [
                  const Text('poster_path - '),
                  Text(Movie().posterPath),
                ],
              ),
              Row(
                children: [
                  const Text('release_date - '),
                  Text(Movie().releaseDate),
                ],
              ),
              Row(
                children: [
                  const Text('title - '),
                  Text(Movie().title),
                ],
              ),
              Row(
                children: [
                  const Text('video - '),
                  Text(Movie().video.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('vote_average - '),
                  Text(Movie().voteAverage.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('vote_count - '),
                  Text(Movie().voteCount.toString()),
                ],
              ),
            ],
          ),
          //Text(Movie().posterPath)
        ],
      ),
    );
  }
}
//casttile component

/*class CastTile extends StatelessWidget {
  const CastTile({
    super.key,
    required this.name,
    required this.cast,
  });

  final String name;
  final String cast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          cast,
          width: 100,
          height: 100,
        ),
        Text(name),
      ],
    );
  }
}
*/