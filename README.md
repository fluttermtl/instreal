# instreal

A new Flutter project.

## Getting Started

### How to start the Firebase emulator

The application requires the Firebase to run. The debug build connects to the local emulator by default while the production build connects to the production Firebase.

1. Install the Firebase CLI <https://firebase.google.com/docs/cli#setup_update_cli>
2. Start emulator

   ```bash
   firebase emulators:start
   ```

**To disable the emulator in the dev environment, disable the line of codes in `lib/main.dart` or build in production mode**

```dart
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
```

### How to initialize Firebase

Reference: <https://firebase.google.com/docs/flutter/setup?platform=web>

1. Create a Firebase project from <https://firebase.google.com/>

2. Install Firebase CLI
  <https://firebase.google.com/docs/cli#setup_update_cli>

3. Login to firebase

   ```bash
   firebase login
   ```

4. Install FlutterFire

   ```bash
   dart pub global activate flutterfire_cli
   ```

5. Configure it using this command in the Project

   ```bash
   flutterfire configure
   ```
