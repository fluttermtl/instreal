import 'package:flutter_test/flutter_test.dart';
import 'package:instreal/features/posts/data/firestore/post_firestore_model.dart';

void main() {
  test('convert json to model', () async {
    final model = PostFirestoreModel.fromDocument({
      'title': 'title',
      'author': 'author',
      'imageUrl': 'imageUrl',
    }, 'id');
    expect(model.id, 'id');
    expect(model.title, 'title');
    expect(model.author, 'author');
    expect(model.imageUrl, 'imageUrl');
  });

  test('convert model to entity', () async {
    final model = PostFirestoreModel.fromDocument({
      'title': 'title',
      'author': 'author',
      'imageUrl': 'imageUrl',
    }, 'id');

    final entity = model.entity;
    expect(entity.id, 'id');
    expect(entity.title, 'title');
    expect(entity.author, 'author');
    expect(entity.imageUrl, 'imageUrl');
  });
}
