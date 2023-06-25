import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instreal/features/postings/posting_firestore_model.dart';

abstract interface class PostingsFirestore {
  Future<List<PostingFirestoreModel>> get postings;
  Future<String> add(PostingFirestoreModel model);
  Future<PostingFirestoreModel> get(String id);
}

class PostingFirestoreImpl implements PostingsFirestore {
  final FirebaseFirestore firestore;
  PostingFirestoreImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<List<PostingFirestoreModel>> get postings async {
    final snapshot = await firestore.collection('postings').get();
    return snapshot.docs
        .map((doc) => PostingFirestoreModel.fromDocument(doc.data(), doc.id))
        .toList();
  }

  @override
  Future<String> add(PostingFirestoreModel model) async {
    final doc = await firestore.collection('postings').add(model.jsonWithoutID);
    return doc.id;
  }

  @override
  Future<PostingFirestoreModel> get(String id) async {
    final snapshot = await firestore.collection('postings').doc(id).get();
    return PostingFirestoreModel.fromDocument(snapshot.data()!, snapshot.id);
  }
}
