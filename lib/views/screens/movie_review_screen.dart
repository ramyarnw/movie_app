import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/review.dart';
import 'package:movie_app/views/screens/create_or_edit_review.dart';
import 'package:provider/provider.dart';

import '../../models/app_state.dart';
import '../../view_model/app_view_model.dart';

class MovieReviewScreen extends StatefulWidget {
  const MovieReviewScreen({super.key, required this.movieId});

  final int movieId;

  @override
  State<MovieReviewScreen> createState() => _MovieReviewScreenState();
}

class _MovieReviewScreenState extends State<MovieReviewScreen> {
  @override
  void initState() {
    super.initState();
    listenMovieReview();
  }

  void listenMovieReview() {
    context
        .read<AppViewModel>()
        .listenMovieReview(movieId: widget.movieId.toString());
  }

  @override
  Widget build(BuildContext context) {
    BuiltList<Review> review =
        context.watch<AppState>().movieReview[widget.movieId] ?? BuiltList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Review Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return CreateOrEditReview(movieId: widget.movieId.toString());
            }));
      }),
      body: ListView.builder(
          itemCount: review.length,
          itemBuilder: (BuildContext context, int index) {
            var p = review[index];
            return ListTile(
              title: Text(p.comments ?? ''),
              subtitle: Text(p.star.toString()),
            );
          }),
    );
  }
}
