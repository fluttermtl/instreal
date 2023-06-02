import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:instreal/models/index.dart';

import 'media_test.dart';

const sampleResponseString = {
  'medias': [
    {
      'id': '1',
      'caption': 'photo1',
      'url':
          'https://raw.githubusercontent.com/fluttermtl/instreal-assets/main/assets/media/photo1.jpg',
      'type': 'image',
    },
    {
      'id': '2',
      'caption': 'photo2',
      'url':
          'https://raw.githubusercontent.com/fluttermtl/instreal-assets/main/assets/media/photo2.jpg',
      'type': 'image',
    },
  ],
};

final sampleResponse =
    Response((b) => b..medias.addAll([sampleMedia1, sampleMedia2]));

void main() {
  group('Response serialization', () {
    test('From json', () {
      final response = Response.fromJson(jsonEncode(sampleResponseString));

      expect(response.medias.first.id, '1');
      expect(response.medias.first.type, MediaType.image);
    });

    test('To json', () {
      final responseString = sampleResponse.toJson();

      expect(responseString, jsonEncode(sampleResponseString));
    });
  });
}
