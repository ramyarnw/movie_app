import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:movie_app/core/api_service.dart';
import 'package:movie_app/models/cast.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/tv_shows.dart';
import 'package:http/http.dart' as http;

extension on String {
  //extension method
  Uri toUri() => Uri.parse(this);
}

class APIUrls {
  String get _baseUrl => 'https://api.themoviedb.org/3';

  String get _movieUrl => '$_baseUrl/movie';

  String get _castUrl => '$_baseUrl/person';

  //String get _tvShowUrl=>'$_baseUrl/tv';
  String get popular => '$_movieUrl/popular';

  String get topRated => '$_movieUrl/top_rated';

  String get upcoming => '$_movieUrl/upcoming';

  String movieCast(int id) => '$_movieUrl/$id/credits';

  String castTvShow(int id) => '$_castUrl/$id/tv_credits';

  String castMovies(int id) => '$_castUrl/$id/movie_credits';

  String moviePic(int id)=> '$_movieUrl/$id';

  String castPic(int id)=> '$_castUrl/$id';
}

class ApiServiceImpl implements ApiService {
  final APIUrls url = APIUrls();

  Map<String, String> get defaultHeader =>
      {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OWI3MjM3YmJjZmYwZmEwNmU0NzgxMWJkZjBlYTEyMyIsIm5iZiI6MTczMDE4MjEyNC41NDY5NjksInN1YiI6IjYxMjMzZjY0ZDY1OTBiMDA1ZDgyNmNkOCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9ypJjMejHuSSD9POiGpF_V7W9yZpExosEKjuoaeDDjc'
      };

  @override
  Future<BuiltList<Cast>> getCastForMovie({required int id}) async {
    http.Response response =
    await http.get((url.movieCast(id)).toUri(), headers: defaultHeader);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)["cast"] as List;
      List<Cast> cast = [];
      for (final i in body) {
        cast.add(Cast.fromJson(i));
      }
      return cast.toBuiltList();
    }
    throw 'Failed to fetch top rated data';
  }

  @override
  Future<BuiltList<Movie>> getMoviesOfCast({required int id}) async {
    http.Response response =
    await http.get((url.castMovies(id)).toUri(), headers: defaultHeader);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)["cast"] as List;
      List<Movie> movies = [];
      for (final i in body) {
        movies.add(Movie.fromJson(i));
      }
      return movies.toBuiltList();
    }
    throw 'Failed to fetch cast movies data';
  }

  @override
  Future<BuiltList<Movie>> getPopularMovie() async {
    http.Response response =
    await http.get((url.popular).toUri(), headers: defaultHeader);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)["results"] as List;
      List<Movie> movies = [];
      for (final i in body) {
        movies.add(Movie.fromJson(i));
      }

      return movies.toBuiltList();
    }
    throw 'Failed to fetch Data';
  }

  @override
  Future<BuiltList<Movie>> getTopRatedMovie() async {
    http.Response response =
    await http.get((url.topRated).toUri(), headers: defaultHeader);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)["results"] as List;
      List<Movie> movies = [];
      for (final i in body) {
        movies.add(Movie.fromJson(i));
      }
      return movies.toBuiltList();
    }
    throw 'Failed to fetch top rated data';
  }

  @override
  Future<BuiltList<TvShows>> getTvShowsOfCast({required int id}) async {
    http.Response response =
    await http.get((url.castTvShow(id)).toUri(), headers: defaultHeader);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)["cast"] as List;
      List<TvShows> tvShows = [];
      for (final i in body) {
        tvShows.add(TvShows.fromJson(i));
      }
      return tvShows.toBuiltList();
    }
    throw 'Failed to fetch cast tv show data';
  }

  @override
  Future<BuiltList<Movie>> getUpcomingMovie() async {
    http.Response response =
    await http.get((url.upcoming).toUri(), headers: defaultHeader);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)["results"] as List;
      List<Movie> movies = [];
      for (final i in body) {
        movies.add(Movie.fromJson(i));
      }
      return movies.toBuiltList();
    }
    throw 'Failed to fetch upcoming data';
  }

  @override
  Future<Movie> getMovieForId({required int id}) async {
    http.Response response = await http.get(
        (url.moviePic(id)).toUri(), headers: defaultHeader);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return Movie.fromJson(body);
    }
    throw 'Failed to load movie image';
  }



  @override
  Future<Cast> getCastForId({required int id}) async {
    http.Response response = await http.get(
        (url.castPic(id)).toUri(), headers: defaultHeader);
    if (response.statusCode == 200) {
      var body = jsonDecode(response.body);
      return Cast.fromJson(body);
    }
    throw 'Failed to load cast image';
  }
}
