// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Response> _$responseSerializer = new _$ResponseSerializer();

class _$ResponseSerializer implements StructuredSerializer<Response> {
  @override
  final Iterable<Type> types = const [Response, _$Response];
  @override
  final String wireName = 'Response';

  @override
  Iterable<Object?> serialize(Serializers serializers, Response object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'medias',
      serializers.serialize(object.medias,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Media)])),
    ];

    return result;
  }

  @override
  Response deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'medias':
          result.medias.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Media)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$Response extends Response {
  @override
  final BuiltList<Media> medias;

  factory _$Response([void Function(ResponseBuilder)? updates]) =>
      (new ResponseBuilder()..update(updates))._build();

  _$Response._({required this.medias}) : super._() {
    BuiltValueNullFieldError.checkNotNull(medias, r'Response', 'medias');
  }

  @override
  Response rebuild(void Function(ResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResponseBuilder toBuilder() => new ResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Response && medias == other.medias;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, medias.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Response')..add('medias', medias))
        .toString();
  }
}

class ResponseBuilder implements Builder<Response, ResponseBuilder> {
  _$Response? _$v;

  ListBuilder<Media>? _medias;
  ListBuilder<Media> get medias => _$this._medias ??= new ListBuilder<Media>();
  set medias(ListBuilder<Media>? medias) => _$this._medias = medias;

  ResponseBuilder();

  ResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _medias = $v.medias.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Response other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Response;
  }

  @override
  void update(void Function(ResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Response build() => _build();

  _$Response _build() {
    _$Response _$result;
    try {
      _$result = _$v ?? new _$Response._(medias: medias.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'medias';
        medias.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Response', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
