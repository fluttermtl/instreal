import 'package:instreal/features/posts/post_entity.dart';
import 'package:instreal/features/posts/post_firestore_model.dart';
import 'package:instreal/features/posts/posts_firestore.dart';

abstract interface class PostsRepository {
  Future<List<Post>> get posts;
  Future<String> add(Post posting);
}

class PostsRepositoryImpl implements PostsRepository {
  PostsRepositoryImpl({required this.firestore});

  final PostsFirestore firestore;

  @override
  Future<List<Post>> get posts async =>
      [for (final post in await firestore.posts) post.entity];

  @override
  Future<String> add(Post post) =>
      firestore.add(PostFirestoreModel.fromEntity(post));
}
