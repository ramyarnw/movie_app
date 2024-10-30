import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:provider/provider.dart';

import '../../models/app_state.dart';
import '../../models/cast.dart';
import '../../view_model/app_view_model.dart';
import '../components/movie_detail_component.dart';

class MovieDetailScreen extends StatefulWidget {
  const MovieDetailScreen({super.key, required this.id});
final int id;

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  var loading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    setState(() {
      loading = true;
    });
    await context.read<AppViewModel>().getMovieForId(id:widget.id);
    await context.read<AppViewModel>().getCastForMovie(id:widget.id);
    setState(() {
      loading = false;
    });
  }



  // List casts = [
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  //   'assets/molly_ringwald.png',
  // ];
  // List castName = [
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  //   'Molly',
  // ];

  @override
  Widget build(BuildContext context) {
    Movie? movie =
        context.watch<AppState>().currentPic;
    BuiltList<Cast> castMovie =
        context
            .watch<AppState>()
            .castForMovie ?? BuiltList();
   if(movie==null){
     return Container();
   }
    //var cast = Cast();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 300,
        flexibleSpace: Image.network(
          movie.posterImage,
          //image,
          width: 80,
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
      body: loading
          ? const CircularProgressIndicator()
          :Column(
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
                itemCount: castMovie.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  var p = castMovie[index];
                  // final cast = casts[index];
                  // final name = castName[index];
                  return CastComponent(
                    cast:p,
                    // castName: name,
                    // imageURL: cast,
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
                  Text(movie.adult.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('backdrop_path - '),
                  Text(movie.backdropPath),
                ],
              ),
              Row(
                children: [
                  const Text('genre_ids - '),
                  Text(movie.genreIds.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('id - '),
                  Text(movie.id.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('original_language - '),
                  Text(movie.originalLanguage)
                ],
              ),
              Row(
                children: [
                  const Text('original_title - '),
                  Text(movie.originalTitle),
                ],
              ),
              Row(
                children: [
                  const Text('overview - '),
                  Text(movie.overview),
                ],
              ),
              Row(
                children: [
                  const Text('popularity - '),
                  Text(movie.popularity.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('poster_path - '),
                  Text(movie.posterPath),
                ],
              ),
              Row(
                children: [
                  const Text('release_date - '),
                  Text(movie.releaseDate),
                ],
              ),
              Row(
                children: [
                  const Text('title - '),
                  Text(movie.title),
                ],
              ),
              Row(
                children: [
                  const Text('video - '),
                  Text(movie.video.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('vote_average - '),
                  Text(movie.voteAverage.toString()),
                ],
              ),
              Row(
                children: [
                  const Text('vote_count - '),
                  Text(movie.voteCount.toString()),
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
