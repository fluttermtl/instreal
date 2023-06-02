import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import 'media.dart';
import 'serializers.dart';

part 'response.g.dart';

abstract class Response implements Built<Response, ResponseBuilder> {
  BuiltList<Media> get medias;

  Response._();

  factory Response([void Function(ResponseBuilder) updates]) = _$Response;

  static Response fromJson(String jsonString) {
    return serializers.fromJson(Response.serializer, jsonString)!;
  }

  String toJson() {
    return serializers.toJson(Response.serializer, this);
  }

  static Serializer<Response> get serializer => _$responseSerializer;
}
