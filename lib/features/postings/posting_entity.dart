import 'package:flutter/material.dart';

@immutable
class Posting {
  final String id;
  final String title;
  final String author;
  final String imageUrl;

  const Posting({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
  });
}
