import 'package:built_collection/built_collection.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:movie_app/core/api_service.dart';
import 'package:movie_app/core/firebase_service.dart';
import 'package:movie_app/data/api_service_impl.dart';
import 'package:movie_app/data/firebase_service_impl.dart';
import 'package:movie_app/models/app_state.dart';
import 'package:movie_app/models/auth_user.dart';
import 'package:movie_app/models/cast.dart';
import 'package:movie_app/models/tv_shows.dart';

import '../models/movie.dart';

class AppViewModel extends StateNotifier<AppState> {
  AppViewModel() : super(AppState());
  ApiService apiService = ApiServiceImpl();
  FireBaseService fireBaseService = FireBaseServiceImpl();
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
  Future<String> sendOtp({required String phoneNo})async
  {
    return await fireBaseService.sendOtp(phoneNo:phoneNo);

  }
  Future<void> verifyOtp({required String smsCode, required String vid})async
  {
    await fireBaseService.verifyOtp(smsCode: smsCode, vid: vid);
    var currentUser=FirebaseAuth.instance.currentUser;
    if(currentUser==null)
      {
        throw 'user not found';
      }
    if(currentUser.phoneNumber==null){
      throw "Phone Number not available";
    }
   AuthUser user= await fireBaseService.getUser(uid: currentUser.uid, phoneNo: currentUser.phoneNumber!);
    state = state.rebuild((p) => p.currentUser = user.toBuilder() );
  }
}
