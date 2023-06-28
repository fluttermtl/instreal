import 'dart:io';

import 'package:flutter/material.dart';

@immutable
class Post extends PostEntity {
  final String id;
  final String imageUrl;

  const Post({
    required this.id,
    required super.title,
    required super.author,
    required this.imageUrl,
  });
}

@immutable
class PostDraft extends PostEntity {
  final File imageFile;

  const PostDraft({
    required super.title,
    required super.author,
    required this.imageFile,
  });

  Post toPost(String imageUrl) => Post(
        id: "",
        title: title,
        author: author,
        imageUrl: imageUrl,
      );
}

@immutable
sealed class PostEntity {
  final String title;
  final String author;
  const PostEntity({required this.title, required this.author});
}
