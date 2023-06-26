import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instreal/features/postings/posting_entity.dart';
import 'package:instreal/features/postings/postings_firestore.dart';
import 'package:instreal/features/postings/postings_repository.dart';
import 'package:instreal/l10n/index.dart';
import 'package:instreal/presentation/components/index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final postingsRepo =
      PostingsRepositoryImpl(firestore: PostingFirestoreImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 160,
            collapsedHeight: 160,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                  ],
                ),
              ),
            ),
            floating: false,
            pinned: false,
          ),
        ],
        body: FutureBuilder<List<Posting>>(
          future: postingsRepo.postings,
          builder: (context, snapshot) => switch (snapshot) {
            AsyncSnapshot(connectionState: ConnectionState.none) ||
            AsyncSnapshot(connectionState: ConnectionState.waiting) ||
            AsyncSnapshot(connectionState: ConnectionState.active) =>
              const Center(
                child: CircularProgressIndicator(),
              ),
            AsyncSnapshot(connectionState: ConnectionState.done, :final data) =>
              ListView.builder(
                itemBuilder: (context, index) => PostCard(
                  posting: data[index],
                ),
                itemCount: data!.length,
                padding: const EdgeInsets.all(16.0),
              ),
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await postingsRepo.add(
            const Posting(
              id: "",
              title: 'title',
              author: 'author',
              imageUrl:
                  'https://i1.wp.com/www.suitcasescholar.com/wp-content/uploads/2012/08/DSC_2583.jpg',
            ),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
