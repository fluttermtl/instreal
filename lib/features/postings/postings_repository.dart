import 'package:instreal/features/postings/posting_entity.dart';
import 'package:instreal/features/postings/posting_firestore_model.dart';
import 'package:instreal/features/postings/postings_firestore.dart';

abstract interface class PostingsRepository {
  Future<List<Posting>> get postings;
  Future<String> add(Posting posting);
}

class PostringsRepositoryImpl implements PostingsRepository {
  PostringsRepositoryImpl({required this.firestore});

  final PostingsFirestore firestore;

  @override
  Future<List<Posting>> get postings async =>
      [for (final posting in await firestore.postings) posting.entity];

  @override
  Future<String> add(Posting posting) =>
      firestore.add(PostingFirestoreModel.fromEntity(posting));
}
