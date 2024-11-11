import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:movie_app/models/serializers.dart';

part 'storage_item.g.dart';

abstract class StorageItem implements Built<StorageItem, StorageItemBuilder> {


  StorageItem._();
  factory StorageItem([void Function(StorageItemBuilder) updates]) = _$StorageItem;

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(StorageItem.serializer, this) as Map<String,dynamic>;
  }

  static StorageItem fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(StorageItem.serializer, json)!;
  }

  static Serializer<StorageItem> get serializer => _$storageItemSerializer;
  String get key;
  String get value;
}