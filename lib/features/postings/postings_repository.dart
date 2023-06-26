import 'package:instreal/features/postings/posting_entity.dart';
import 'package:instreal/features/postings/postings_firestore.dart';

abstract interface class PostingsRepository {
  Future<List<Posting>> get postings;
}

class PostringsRepositoryImpl implements PostingsRepository {
  PostringsRepositoryImpl({required this.firestore});

  final PostingsFirestore firestore;

  @override
  Future<List<Posting>> get postings async =>
      [for (final posting in await firestore.postings) posting.entity];
}
