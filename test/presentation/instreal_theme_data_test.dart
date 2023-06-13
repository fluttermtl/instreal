import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instreal/presentation/themes/instreal_theme_data.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group('Verify theme color scheme', () {
    test('light color scheme', () async {
      final lightThemeData = InstrealThemeData.lightThemeData;

      expect(lightThemeData.colorScheme.primary, const Color(0xFF864394));
      expect(lightThemeData.colorScheme.background, const Color(0xFFFFDEAD));
    });
    test('dark color scheme', () async {
      final darkThemeData = InstrealThemeData.darkThemeData;

      expect(darkThemeData.colorScheme.primary, const Color(0xFFFFDEAD));
      expect(darkThemeData.colorScheme.background, const Color(0xFF241E30));
    });
  });

  group('Verify component themes are set', () {
    test('text theme', () async {
      final themeData = InstrealThemeData.lightThemeData;

      expect(themeData.textTheme.titleLarge!.fontSize, 48.0);
      expect(themeData.textTheme.titleLarge!.fontWeight, FontWeight.w700);
      expect(
        themeData.textTheme.titleLarge!.fontFamily,
        GoogleFonts.openSans(fontWeight: FontWeight.w700).fontFamily,
      );
    });
  });
}
