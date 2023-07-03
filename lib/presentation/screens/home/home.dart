import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instreal/features/posts/data/firestorage/posts_firestorage.dart';
import 'package:instreal/features/posts/post_entity.dart';
import 'package:instreal/features/posts/data/firestore/posts_firestore.dart';
import 'package:instreal/features/posts/posts_repository.dart';
import 'package:instreal/l10n/index.dart';
import 'package:instreal/presentation/components/index.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final postingsRepo = PostsRepositoryImpl(
    firestore: PostFirestoreImpl(),
    firestorage: PostsFirestorageImpl(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            expandedHeight: 200,
            collapsedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 32.0),
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
        body: FutureBuilder<List<Post>>(
          future: postingsRepo.posts,
          builder: (context, snapshot) => switch (snapshot) {
            AsyncSnapshot(connectionState: ConnectionState.done, :final data) =>
              ListView.builder(
                itemBuilder: (context, index) => PostCard(posting: data[index]),
                itemCount: data!.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            _ => const Center(
                child: CircularProgressIndicator(),
              ),
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await postingsRepo.add(
            PostDraft(
              title: 'title',
              author: 'author',
              imageFile: File(
                'https://i1.wp.com/www.suitcasescholar.com/wp-content/uploads/2012/08/DSC_2583.jpg',
              ),
            ).toPost('imageUrl'),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
