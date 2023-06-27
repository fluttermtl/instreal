import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instreal/features/posts/post_firestore_model.dart';

abstract interface class PostsFirestore {
  Future<List<PostFirestoreModel>> get posts;
  Future<String> add(PostFirestoreModel model);
  Future<PostFirestoreModel> get(String id);
}

class PostFirestoreImpl implements PostsFirestore {
  final CollectionReference<Map<String, dynamic>> collection;

  PostFirestoreImpl({FirebaseFirestore? firestore})
      : collection =
            (firestore ?? FirebaseFirestore.instance).collection('posts');

  @override
  Future<List<PostFirestoreModel>> get posts async {
    final snapshot = await collection.get();
    return snapshot.docs
        .map((doc) => PostFirestoreModel.fromDocument(doc.data(), doc.id))
        .toList();
  }

  @override
  Future<String> add(PostFirestoreModel model) async {
    final doc = await collection.add(model.jsonWithoutID);
    return doc.id;
  }

  @override
  Future<PostFirestoreModel> get(String id) async {
    final snapshot = await collection.doc(id).get();
    return PostFirestoreModel.fromDocument(snapshot.data()!, snapshot.id);
  }
}
