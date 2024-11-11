import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movie_app/core/api_service.dart';
import 'package:movie_app/core/firebase_service.dart';
import 'package:movie_app/core/storage_service.dart';
import 'package:movie_app/data/api_service_impl.dart';
import 'package:movie_app/data/firebase_service_impl.dart';
import 'package:movie_app/data/storage_service_impl.dart';
import 'package:movie_app/models/app_state.dart';
import 'package:movie_app/models/auth_user.dart';
import 'package:movie_app/models/cast.dart';
import 'package:movie_app/models/tv_shows.dart';

import '../models/movie.dart';
import '../models/review.dart';
import '../models/storage_model/storage_item.dart';

class AppViewModel extends StateNotifier<AppState> {
  AppViewModel() : super(AppState());

  AppState getState() => state;

  ApiService apiService = ApiServiceImpl();
  FireBaseService fireBaseService = FireBaseServiceImpl();
  StorageService storageService = StorageServiceImpl();

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

  Future<void> getCastForMovie({required int id}) async {
    BuiltList<Cast> cast = await apiService.getCastForMovie(id: id);
    state = state.rebuild((p3) => p3.castForMovie = cast.toBuilder());
  }

  Future<void> getMoviesOfCast({required int id}) async {
    BuiltList<Movie> moviesCast = await apiService.getMoviesOfCast(id: id);
    state = state.rebuild((p4) => p4.moviesOfCast = moviesCast.toBuilder());
  }

  Future<void> getTvShowsOfCast({required int id}) async {
    BuiltList<TvShows> tvCast = await apiService.getTvShowsOfCast(id: id);
    state = state.rebuild((p4) => p4.tvShowsOfCast = tvCast.toBuilder());
  }

  Future<void> getMovieForId({required int id}) async {
    Movie moviePic = await apiService.getMovieForId(id: id);
    state = state.rebuild(
      (p) => p.currentPic = moviePic.toBuilder(),
    );
  }

  Future<void> getCastForId({required int id}) async {
    Cast castPic = (await apiService.getCastForId(id: id));
    state = state.rebuild(
      (p) => p.currentPicCast = castPic.toBuilder(),
    );
  }

  Future<String> sendOtp({required String phoneNo}) async {
    return await fireBaseService.sendOtp(phoneNo: phoneNo);
  }

  Future<void> verifyOtp({required String smsCode, required String vid}) async {
    await fireBaseService.verifyOtp(smsCode: smsCode, vid: vid);
    var currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw 'user not found';
    }
    if (currentUser.phoneNumber == null) {
      throw "Phone Number not available";
    }
    AuthUser user = await fireBaseService.getUser(
        uid: currentUser.uid, phoneNo: currentUser.phoneNumber!);
    state = state.rebuild((p) => p.currentUser = user.toBuilder());
  }

  Future<void> createMovieReview(
      {required String movieId, required Review review}) async {
    await fireBaseService.createMovieReview(movieId: movieId, review: review);
  }

  Future<void> createTVReview(
      {required String tvId, required Review review}) async {
    await fireBaseService.createTVReview(tvId: tvId, review: review);
  }

  Future<void> deleteMovieReview(
      {required String movieId, required String reviewId}) async {
    await fireBaseService.deleteMovieReview(
        movieId: movieId, reviewId: reviewId);
  }

  Future<void> deleteTVReview(
      {required String tvId, required String reviewId}) async {
    await fireBaseService.deleteTVReview(tvId: tvId, reviewId: reviewId);
  }

  Future<void> updateMovieReview(
      {required String movieId, required Review review}) async {
    await fireBaseService.updateMovieReview(movieId: movieId, review: review);
  }

  Future<void> updateTvReview(
      {required String tvId, required Review review}) async {
    await fireBaseService.updateTvReview(tvId: tvId, review: review);
  }

  Map<String, StreamSubscription<BuiltList<Review>>> movieSubscription = {};

  @override
  void dispose() {
    super.dispose();
    for (var b in movieSubscription.values) {
      b.cancel();
    }
    for (var b in tvSubscription.values) {
      b.cancel();
    }
  }

  void listenMovieReview({required String movieId}) {
    movieSubscription[movieId] = fireBaseService
        .listenMovieReview(movieId: movieId)
        .asBroadcastStream()
        .listen((BuiltList<Review> e) {
      state = state.rebuild((b) => b.movieReview[movieId] = e);
    });
  }

  Map<String, StreamSubscription<BuiltList<Review>>> tvSubscription = {};

  void listenTvReview({required String tvId}) {
    tvSubscription[tvId] = fireBaseService
        .listenTVReview(tvId: tvId)
        .asBroadcastStream()
        .listen((BuiltList<Review> e) {
      state = state.rebuild((b) => b.tvReview[tvId] = e);
    });
  }

  Future<void> updateUser({required AuthUser user}) async {
    AuthUser u = await fireBaseService.updateUser(user: user);
    state = state.rebuild((p1) => p1.currentUser = u.toBuilder());
  }

  Future<void> updateProfile(
      {required Uint8List file, required AuthUser user}) async {
    AuthUser u = await fireBaseService.updateProfile(user: user, file: file);
    state = state.rebuild((p1) => p1.currentUser = u.toBuilder());
  }

  Future<void> writeSecureData({required StorageItem newItem}) async {
    await storageService.writeSecureData(newItem: newItem);
    state = state.rebuild((a) => a.item = newItem.toBuilder());
  }

  Future<void> readSecureData({required String key}) async {
    String? r = await storageService.readSecureData(key: key);
    state = state.rebuild((a) => a.item = StorageItem((b) => b
      ..key = key
      ..value = r ?? '').toBuilder());
  }
  Future<void> deleteSecureData({required StorageItem item}) async {
    await storageService.deleteSecureData(item: item);
  }

  Future<void> readAllSecureData() async {
     BuiltList<StorageItem> r = await storageService.readAllSecureData();
     state = state.rebuild((a) => a.itemList = r.toBuilder());
  }
  Future<void> deleteAllSecureData() async {
    await storageService.deleteAllSecureData();
  }
  Future<void> containsKeyInSecureData({required String key}) async {
    await storageService.containsKeyInSecureData(key: key);
  }

}
