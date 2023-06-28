import 'package:instreal/features/posts/data/firestorage/posts_firestorage.dart';
import 'package:instreal/features/posts/data/firestore/post_firestore_model.dart';
import 'package:instreal/features/posts/data/firestore/posts_firestore.dart';
import 'package:instreal/features/posts/post_entity.dart';

abstract interface class PostsRepository {
  Future<List<Post>> get posts;
  Future<String> add(Post posting);
}

class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl({required this.firestore, required this.firestorage});

  final PostsFirestore firestore;
  final PostsFirestorage firestorage;

  @override
  Future<List<Post>> get posts async =>
      [for (final post in await firestore.posts) post.entity];

  @override
  Future<String> add(Post post) =>
      firestore.add(PostFirestoreModel.fromEntity(post));
}
