import 'package:flutter/material.dart';

@immutable
class Post {
  final String id;
  final String title;
  final String author;
  final String imageUrl;

  const Post({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
  });
}
