import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'serializers.dart';

part 'media.g.dart';

abstract class Media implements Built<Media, MediaBuilder> {
  String get id;

  String get caption;

  String get url;

  MediaType get type;

  Media._();

  factory Media([void Function(MediaBuilder) updates]) = _$Media;

  static Media fromJson(String jsonString) {
    return serializers.fromJson(Media.serializer, jsonString)!;
  }

  String toJson() {
    return serializers.toJson(Media.serializer, this);
  }

  static Serializer<Media> get serializer => _$mediaSerializer;
}

class MediaType extends EnumClass {
  static const MediaType image = _$image;
  static const MediaType video = _$video;

  const MediaType._(super.name);

  static BuiltSet<MediaType> get values => _$values;

  static MediaType valueOf(String name) => _$valueOf(name);

  static Serializer<MediaType> get serializer => _$mediaTypeSerializer;
}
