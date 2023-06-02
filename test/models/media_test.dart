import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:instreal/models/index.dart';

const sampleMediaString1 = {
  'id': '1',
  'caption': 'photo1',
  'url':
      'https://raw.githubusercontent.com/fluttermtl/instreal-assets/main/assets/media/photo1.jpg',
  'type': 'image',
};

const sampleMediaString2 = {
  'id': '2',
  'caption': 'photo2',
  'url':
      'https://raw.githubusercontent.com/fluttermtl/instreal-assets/main/assets/media/photo2.jpg',
  'type': 'image',
};

final sampleMedia1 = Media(
  (b) => b
    ..id = '1'
    ..caption = 'photo1'
    ..url =
        'https://raw.githubusercontent.com/fluttermtl/instreal-assets/main/assets/media/photo1.jpg'
    ..type = MediaType.image,
);
final sampleMedia2 = Media(
  (b) => b
    ..id = '2'
    ..caption = 'photo2'
    ..url =
        'https://raw.githubusercontent.com/fluttermtl/instreal-assets/main/assets/media/photo2.jpg'
    ..type = MediaType.image,
);

void main() {
  group('Media serialization', () {
    test('From json', () {
      final media1 = Media.fromJson(jsonEncode(sampleMediaString1));
      final media2 = Media.fromJson(jsonEncode(sampleMediaString2));

      expect(media1.id, '1');
      expect(media2.id, '2');
      expect(media2.caption, 'photo2');
      expect(media1.type, MediaType.image);
    });

    test('To json', () {
      final mediaString1 = sampleMedia1.toJson();
      final mediaString2 = sampleMedia2.toJson();

      expect(mediaString1, jsonEncode(sampleMediaString1));
      expect(mediaString2, jsonEncode(sampleMediaString2));
    });
  });
}
