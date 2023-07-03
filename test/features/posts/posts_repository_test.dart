import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:instreal/features/posts/data/firestorage/firestorage_event.dart';
import 'package:instreal/features/posts/data/firestorage/posts_firestorage.dart';
import 'package:instreal/features/posts/data/firestore/post_firestore_model.dart';
import 'package:instreal/features/posts/data/firestore/posts_firestore.dart';
import 'package:instreal/features/posts/posts_repository.dart';

class MockFirestore implements PostsFirestore {
  List<PostFirestoreModel> mock = [];
  @override
  Future<List<PostFirestoreModel>> get posts async {
    return mock;
  }

  void clean() {
    mock = [];
  }

  @override
  Future<String> add(PostFirestoreModel model) async {
    mock.add(model);
    return model.id;
  }

  @override
  Future<PostFirestoreModel> get(String id) {
    throw UnimplementedError();
  }
}

class MockFireStorage implements PostsFirestorage {
  @override
  Stream<FirestorageEvent> upload(File image) {
    throw UnimplementedError();
  }
}

void main() {
  test('convert model to entity', () async {
    final mockStore = MockFirestore();
    final mockStorage = MockFireStorage();
    final mockModelData = PostFirestoreModel.fromDocument({
      'title': 'title',
      'author': 'author',
      'imageUrl': 'imageUrl',
    }, 'id');
    mockStore.add(mockModelData);
    final repo = PostsRepositoryImpl(
      firestore: mockStore,
      firestorage: mockStorage,
    );
    final posts = await repo.posts;
    expect(posts.length, 1);
    expect(posts[0].id, 'id');
    expect(posts[0].title, 'title');
    expect(posts[0].author, 'author');
    expect(posts[0].imageUrl, 'imageUrl');
  });
}
