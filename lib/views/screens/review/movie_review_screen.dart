import 'package:built_collection/built_collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/main.dart';
import 'package:movie_app/models/review.dart';
import 'package:movie_app/views/mixins/movie_mixin.dart';
import 'package:movie_app/views/screens/review/create_or_edit_review.dart';
import 'package:movie_app/views/screens/app/movie_home_page.dart';
import 'package:provider/provider.dart';

import '../../../models/app_state.dart';
import '../../../view_model/app_view_model.dart';

class MovieReviewScreen extends StatefulWidget {
  const MovieReviewScreen({super.key, required this.movieId});

  final int movieId;

  @override
  State<MovieReviewScreen> createState() => _MovieReviewScreenState();
}

class _MovieReviewScreenState extends State<MovieReviewScreen> with MovieMixin {
  @override
  void initState() {
    super.initState();
    listenMovieReview(movieId: widget.movieId.toString());
  }

  // void listenMovieReview() {
  //   context
  //       .appViewModel
  //       .listenMovieReview(movieId: widget.movieId.toString());
  // }

  @override
  Widget build(BuildContext context) {
    BuiltList<Review> review =
        context.appState.movieReview[widget.movieId] ?? BuiltList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Review Screen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) {
              return CreateOrEditReview(movieId: widget.movieId.toString());
            },
            ),
        );
      }, child: const Icon(Icons.add),),


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
