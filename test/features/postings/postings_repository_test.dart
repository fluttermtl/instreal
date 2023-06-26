import 'package:flutter_test/flutter_test.dart';
import 'package:instreal/features/postings/posting_firestore_model.dart';
import 'package:instreal/features/postings/postings_firestore.dart';
import 'package:instreal/features/postings/postings_repository.dart';

class MockFirestore implements PostingsFirestore {
  List<PostingFirestoreModel> mock = [];
  @override
  Future<List<PostingFirestoreModel>> get postings async {
    return mock;
  }

  void clean() {
    mock = [];
  }

  @override
  Future<String> add(PostingFirestoreModel model) async {
    mock.add(model);
    return model.id;
  }

  @override
  Future<PostingFirestoreModel> get(String id) {
    throw UnimplementedError();
  }
}

void main() {
  test('convert model to entity', () async {
    final mockStore = MockFirestore();
    final mockModelData = PostingFirestoreModel.fromDocument({
      'title': 'title',
      'author': 'author',
      'imageUrl': 'imageUrl',
    }, 'id');
    mockStore.add(mockModelData);
    final repo = PostingsRepositoryImpl(firestore: mockStore);
    final postings = await repo.postings;
    expect(postings.length, 1);
    expect(postings[0].id, 'id');
    expect(postings[0].title, 'title');
    expect(postings[0].author, 'author');
    expect(postings[0].imageUrl, 'imageUrl');
  });
}
