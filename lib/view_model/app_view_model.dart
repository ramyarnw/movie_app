import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movie_app/core/api_service.dart';
import 'package:movie_app/data/api_service_impl.dart';
import 'package:movie_app/models/app_state.dart';
import 'package:movie_app/models/cast.dart';
import 'package:movie_app/models/tv_shows.dart';

import '../models/movie.dart';

class AppViewModel extends StateNotifier<AppState> {
  AppViewModel() : super(AppState());
  ApiService apiService = ApiServiceImpl();

  Future<void> getPopularMovie() async {
    BuiltList<Movie> popular = await apiService.getPopularMovie();
    state = state.rebuild((p0) => p0.popularMovie = popular.toBuilder());
  }

  Future<void> getTopRatedMovie() async {
    BuiltList<Movie> topRated = await apiService.getTopRatedMovie();
    state = state.rebuild((p1) => p1.topRatedMovie = topRated.toBuilder());
  }

  Future<void> getUpcoming() async {
    BuiltList<Movie> upcoming = await apiService.getUpcomingMovie();
    state = state.rebuild((p2) => p2.upcomingMovie = upcoming.toBuilder());
  }

  Future<void> getCastForMovie(int id) async {
    BuiltList<Cast> cast = await apiService.getCastForMovie(id: id);
    state = state.rebuild((p3) => p3.castForMovie = cast.toBuilder());
  }

  Future<void> getMoviesOfCast(int id) async {
    BuiltList<Movie> moviesCast = await apiService.getMoviesOfCast(id: id);
    state = state.rebuild((p4) => p4.moviesOfCast = moviesCast.toBuilder());
  }

  Future<void> getTvShowsOfCast(int id) async {
    BuiltList<TvShows> tvCast = await apiService.getTvShowsOfCast(id: id);
    state = state.rebuild((p4) => p4.tvShowsOfCast = tvCast.toBuilder());
  }
}
