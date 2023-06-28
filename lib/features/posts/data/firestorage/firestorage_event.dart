import 'package:firebase_storage/firebase_storage.dart';

class FirestorageEventPaused extends FirestorageEvent {
  const FirestorageEventPaused(super.event);
}

class FirestorageEventRunning extends FirestorageEvent {
  const FirestorageEventRunning(super.event);
}

class FirestorageEventSuccess extends FirestorageEvent {
  const FirestorageEventSuccess(super.event);
  Future<String> get downloadURL => _event.ref.getDownloadURL();
}

class FirestorageEventCanceled extends FirestorageEvent {
  const FirestorageEventCanceled(super.event);
}

class FirestorageEventError extends FirestorageEvent {
  const FirestorageEventError(super.event);
}

sealed class FirestorageEvent {
  const FirestorageEvent(this._event);
  final TaskSnapshot _event;
  int get bytesTransferred => _event.bytesTransferred;
  int get totalBytes => _event.totalBytes;

  factory FirestorageEvent.fromSnapshot(TaskSnapshot event) => switch (event) {
        TaskSnapshot(state: TaskState.paused) => FirestorageEventPaused(event),
        TaskSnapshot(state: TaskState.running) =>
          FirestorageEventRunning(event),
        TaskSnapshot(state: TaskState.success) =>
          FirestorageEventSuccess(event),
        TaskSnapshot(state: TaskState.canceled) =>
          FirestorageEventCanceled(event),
        TaskSnapshot(state: TaskState.error) => FirestorageEventError(event),
      };
}
