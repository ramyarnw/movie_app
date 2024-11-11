import 'package:built_collection/src/list.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/models/app_state.dart';
import 'package:movie_app/models/review.dart';
import 'package:movie_app/view_model/app_view_model.dart';
import 'package:provider/provider.dart';

class CreateOrEditReview extends StatefulWidget {
  const CreateOrEditReview({super.key, required this.movieId, this.reviewId});

  final String movieId;
  final String? reviewId;

  @override
  State<CreateOrEditReview> createState() => _CreateOrEditReviewState();
}

class _CreateOrEditReviewState extends State<CreateOrEditReview> {
  Review review = Review(
    (b) => b
      ..star = 1
      ..comments = ''
      ..id = ''
      ..userId = '',
  );

  @override
  void initState() {
    super.initState();
    if (widget.reviewId == null) {
      return;
    }
    BuiltList<Review> currentMovieReviews =
        context.read<AppViewModel>().getState().movieReview?[widget.movieId] ??
            BuiltList();
    var b =
        currentMovieReviews.where((c) => c.id == widget.reviewId).firstOrNull;
    if (b == null) {
      return;
    }
    review = b;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            DropdownButtonFormField<int>(
              value: review.star,
                items: [
                  for (int i = 1; i <= 5; i++) ...[
                    DropdownMenuItem(
                      value: i,
                      child: Text(
                        i.toString(),
                      ),
                    ),
                  ],
                ],
                onChanged: (int? v) {
                  if (v == null) {
                    return;
                  }
                  review = review.rebuild((p0) => p0.star = v);
                  setState(() {});
                }),
            TextFormField(
              initialValue: review.comments,
              onChanged: (String s) {
                review = review.rebuild((p) => p.comments = s);
                setState(() {});
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Comments enter here',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                if (widget.reviewId != null) {
                  await context.read<AppViewModel>().updateMovieReview(
                      movieId: widget.movieId, review: review);
                } else {
                  await context.read<AppViewModel>().createMovieReview(
                        movieId: widget.movieId,
                        review: review.rebuild(
                          (p0) => p0.userId = context
                              .read<AppViewModel>()
                              .getState()
                              .currentUser!
                              .id,
                        ),
                      );
                }
              },
              child: Text(widget.reviewId != null ? 'Update' : 'Create'),
            )
          ],
        ),
      ),
    );
  }
}
