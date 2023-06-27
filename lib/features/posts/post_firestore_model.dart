import 'package:instreal/features/posts/post_entity.dart';

class PostFirestoreModel {
  final String id;
  final String title;
  final String author;
  final String imageUrl;

  PostFirestoreModel({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  factory PostFirestoreModel.fromDocument(
      Map<String, dynamic> document, String id) {
    if (document
        case {
          'title': String? title,
          'author': String? author,
          'imageUrl': String? imageUrl,
        }) {
      return PostFirestoreModel(
        id: id,
        title: title ?? '',
        author: author ?? '',
        imageUrl: imageUrl ?? '',
      );
    }
    throw Exception('Invalid document');
  }

  factory PostFirestoreModel.fromEntity(Post entity) => PostFirestoreModel(
        id: entity.id,
        title: entity.title,
        author: entity.author,
        imageUrl: entity.imageUrl,
      );

  Post get entity => Post(
        id: id,
        title: title,
        author: author,
        imageUrl: imageUrl,
      );

  Map<String, dynamic> get jsonWithoutID => {
        'title': title,
        'author': author,
        'imageUrl': imageUrl,
      };
}
