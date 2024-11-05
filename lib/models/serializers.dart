import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:movie_app/models/review.dart';
import 'package:movie_app/models/tv_shows.dart';

import 'app_state.dart';
import 'auth_user.dart';
import 'cast.dart';
import 'movie.dart';

part 'serializers.g.dart';

@SerializersFor(<Type>[
  Movie,
  Cast,
  TvShows,
  AppState,
  AuthUser,
  Review,
  //ApiError,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
