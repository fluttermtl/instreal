import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:instreal/features/posts/data/firestorage/firestorage_event.dart';

abstract interface class PostsFirestorage {
  Stream<FirestorageEvent> upload(File image);
}

class PostsFirestorageImpl implements PostsFirestorage {
  PostsFirestorageImpl({FirebaseStorage? storage})
      : storageRef = (storage ?? FirebaseStorage.instance).ref("posts");

  final Reference storageRef;

  @override
  Stream<FirestorageEvent> upload(File image) {
    final task = storageRef.child('image.jpg').putFile(image);
    return task.snapshotEvents.map<FirestorageEvent>(
      (event) => FirestorageEvent.fromSnapshot(event),
    );
  }
}
