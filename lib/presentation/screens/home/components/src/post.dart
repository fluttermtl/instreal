import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

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
                'https://i1.wp.com/www.suitcasescholar.com/wp-content/uploads/2012/08/DSC_2583.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'The weather is amazing. I feel very joyful today,',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontFamily: GoogleFonts.dancingScript().fontFamily,
                  ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Spacer(),
                Text(
                  '~David L,',
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
