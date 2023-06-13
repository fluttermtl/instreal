import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instreal/l10n/index.dart';
import 'package:instreal/presentation/themes/instreal_theme_data.dart';

void main() {
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
      theme: InstrealThemeData.lightThemeData,
      darkTheme: InstrealThemeData.darkThemeData,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: ListView(
          children: [
            Text(
              InstrealLocalizations.of(context)!.whatsUpIn,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              InstrealLocalizations.of(context)!.montreal,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontFamily: GoogleFonts.caveat().fontFamily,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const Card(
              color: Colors.white,
              child: Text('Test the text'),
            ),
          ],
        ),
      ),
    );
  }
}
