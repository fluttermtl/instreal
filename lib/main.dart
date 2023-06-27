import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instreal/l10n/index.dart';
import 'package:instreal/presentation/screens/home/home.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator(
        defaultTargetPlatform == TargetPlatform.android
            ? "10.0.2.2"
            : "localhost",
        8080,
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: InstrealLocalizations.localizationsDelegates,
      supportedLocales: InstrealLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.purple,
        textTheme: ThemeData.light()
            .textTheme
            .apply(fontFamily: GoogleFonts.openSans().fontFamily),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.purple,
        textTheme: ThemeData.dark()
            .textTheme
            .apply(fontFamily: GoogleFonts.openSans().fontFamily),
      ),
      home: const MyHomePage(),
    );
  }
}
