import 'package:flutter/material.dart';

const mockDate = '''
{
  "data": [
    {
      "id": "1",
      "image": "https://via.placeholder.com/600/92c952",
      "description": "description 1"
    },
    {
      "id": "2",
      "image": "https://via.placeholder.com/600/92c952",
      "description": "description 2"
    },
    {
      "id": "3",
      "image": "https://via.placeholder.com/600/92c952",
      "description": "description 3"
    }
  ]
}
''';

@immutable
class Content {
  final String id;
  final String image;
  final String description;

  factory Content.fromJson(Map<String, dynamic> json) {
    return Content(
      id: json['id'] as String,
      image: json['image'] as String,
      description: json['description'] as String,
    );
  }

  const Content({
    required this.id,
    required this.image,
    required this.description,
  });
}
