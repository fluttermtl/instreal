// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const MediaType _$image = const MediaType._('image');
const MediaType _$video = const MediaType._('video');

MediaType _$valueOf(String name) {
  switch (name) {
    case 'image':
      return _$image;
    case 'video':
      return _$video;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<MediaType> _$values = new BuiltSet<MediaType>(const <MediaType>[
  _$image,
  _$video,
]);

Serializer<Media> _$mediaSerializer = new _$MediaSerializer();
Serializer<MediaType> _$mediaTypeSerializer = new _$MediaTypeSerializer();

class _$MediaSerializer implements StructuredSerializer<Media> {
  @override
  final Iterable<Type> types = const [Media, _$Media];
  @override
  final String wireName = 'Media';

  @override
  Iterable<Object?> serialize(Serializers serializers, Media object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'id',
      serializers.serialize(object.id, specifiedType: const FullType(String)),
      'caption',
      serializers.serialize(object.caption,
          specifiedType: const FullType(String)),
      'url',
      serializers.serialize(object.url, specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(MediaType)),
    ];

    return result;
  }

  @override
  Media deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MediaBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'caption':
          result.caption = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'url':
          result.url = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(MediaType))! as MediaType;
          break;
      }
    }

    return result.build();
  }
}

class _$MediaTypeSerializer implements PrimitiveSerializer<MediaType> {
  @override
  final Iterable<Type> types = const <Type>[MediaType];
  @override
  final String wireName = 'MediaType';

  @override
  Object serialize(Serializers serializers, MediaType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  MediaType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      MediaType.valueOf(serialized as String);
}

class _$Media extends Media {
  @override
  final String id;
  @override
  final String caption;
  @override
  final String url;
  @override
  final MediaType type;

  factory _$Media([void Function(MediaBuilder)? updates]) =>
      (new MediaBuilder()..update(updates))._build();

  _$Media._(
      {required this.id,
      required this.caption,
      required this.url,
      required this.type})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Media', 'id');
    BuiltValueNullFieldError.checkNotNull(caption, r'Media', 'caption');
    BuiltValueNullFieldError.checkNotNull(url, r'Media', 'url');
    BuiltValueNullFieldError.checkNotNull(type, r'Media', 'type');
  }

  @override
  Media rebuild(void Function(MediaBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MediaBuilder toBuilder() => new MediaBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Media &&
        id == other.id &&
        caption == other.caption &&
        url == other.url &&
        type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, caption.hashCode);
    _$hash = $jc(_$hash, url.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Media')
          ..add('id', id)
          ..add('caption', caption)
          ..add('url', url)
          ..add('type', type))
        .toString();
  }
}

class MediaBuilder implements Builder<Media, MediaBuilder> {
  _$Media? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _caption;
  String? get caption => _$this._caption;
  set caption(String? caption) => _$this._caption = caption;

  String? _url;
  String? get url => _$this._url;
  set url(String? url) => _$this._url = url;

  MediaType? _type;
  MediaType? get type => _$this._type;
  set type(MediaType? type) => _$this._type = type;

  MediaBuilder();

  MediaBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _caption = $v.caption;
      _url = $v.url;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Media other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Media;
  }

  @override
  void update(void Function(MediaBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Media build() => _build();

  _$Media _build() {
    final _$result = _$v ??
        new _$Media._(
            id: BuiltValueNullFieldError.checkNotNull(id, r'Media', 'id'),
            caption: BuiltValueNullFieldError.checkNotNull(
                caption, r'Media', 'caption'),
            url: BuiltValueNullFieldError.checkNotNull(url, r'Media', 'url'),
            type:
                BuiltValueNullFieldError.checkNotNull(type, r'Media', 'type'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
