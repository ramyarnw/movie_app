import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie_app/models/serializers.dart';
import 'package:movie_app/models/tv_shows.dart';

import 'cast.dart';
import 'movie.dart';

part 'app_state.g.dart';

abstract class AppState implements Built<AppState, AppStateBuilder> {
  AppState._();

  factory AppState([void Function(AppStateBuilder) updates]) = _$AppState;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(AppState.serializer, this)
        as Map<String, int>;
  }

  static AppState fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(AppState.serializer, json)!;
  }

  static Serializer<AppState> get serializer => _$appStateSerializer;

  BuiltList<Movie>? get popularMovie;

  BuiltList<Movie>? get topRatedMovie;

  BuiltList<Movie>? get upcomingMovie;

  BuiltList<Cast>? get castForMovie;

  BuiltList<Movie>? get moviesOfCast;

  BuiltList<TvShows>? get tvShowsOfCast;

  Movie? get currentPic;

  //Movie get moviePic;
}
