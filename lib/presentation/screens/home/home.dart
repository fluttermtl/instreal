import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instreal/l10n/index.dart';

import 'components/index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Text(
            InstrealLocalizations.of(context)!.whatsUpIn,
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            InstrealLocalizations.of(context)!.montreal,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontFamily: GoogleFonts.caveat().fontFamily,
                ),
          ),
          const PostCard(),
          const PostCard(),
          const PostCard(),
          const PostCard(),
        ],
      ),
    );
  }
}
