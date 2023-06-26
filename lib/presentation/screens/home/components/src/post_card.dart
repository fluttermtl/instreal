import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instreal/features/postings/posting_entity.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key, required this.posting});

  final Posting posting;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: 1 / 2,
              child: Image.network(
                posting.imageUrl,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              posting.title,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: GoogleFonts.dancingScript().fontFamily,
                  ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Spacer(),
                Text(
                  '- ${posting.author}',
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontFamily: GoogleFonts.dancingScript().fontFamily,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
