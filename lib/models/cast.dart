import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie_app/models/serializers.dart';

part 'cast.g.dart';

abstract class Cast implements Built<Cast, CastBuilder> {


  Cast._();
  factory Cast([void Function(CastBuilder) updates]) = _$Cast;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Cast.serializer, this) as Map<String,dynamic>;
  }

  static Cast fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Cast.serializer, json)!;
  }

  static Serializer<Cast> get serializer => _$castSerializer;
  static void initializeBuilder(CastBuilder a) {
    a..adult = false
        ..gender = 1;

  }
bool get adult;
int get gender;
int get id;
  @BuiltValueField(wireName: 'known_for_department', )
  String get knownForDepartment;
  String get name;
  @BuiltValueField(wireName: 'original_name', )
  String get originalName;
  int get popularity;
  @BuiltValueField(wireName: 'profile_path', )
  String get profilePath;
  @BuiltValueField(wireName: 'cast_id', )
  int get castId;
  String get character;
  @BuiltValueField(wireName: 'credit_id', )
  String get creditId;
  int get order;

}