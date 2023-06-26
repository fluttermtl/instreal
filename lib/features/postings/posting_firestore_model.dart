import 'package:instreal/features/postings/posting_entity.dart';

class PostingFirestoreModel {
  final String id;
  final String title;
  final String author;
  final String imageUrl;

  PostingFirestoreModel({
    required this.id,
    required this.title,
    required this.author,
    required this.imageUrl,
  });

  factory PostingFirestoreModel.fromDocument(
      Map<String, dynamic> document, String id) {
    if (document
        case {
          'title': String? title,
          'author': String? author,
          'imageUrl': String? imageUrl,
        }) {
      return PostingFirestoreModel(
        id: id,
        title: title ?? '',
        author: author ?? '',
        imageUrl: imageUrl ?? '',
      );
    }
    throw Exception('Invalid document');
  }

  factory PostingFirestoreModel.fromEntity(Posting entity) =>
      PostingFirestoreModel(
        id: entity.id,
        title: entity.title,
        author: entity.author,
        imageUrl: entity.imageUrl,
      );

  Posting get entity => Posting(
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
