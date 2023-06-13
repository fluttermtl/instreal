import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstrealThemeData {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.titleMedium!.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF864394),
    primaryContainer: Color(0xFF117378),
    secondary: Color(0xFFEFF3F3),
    secondaryContainer: Color(0xFFFAFBFB),
    background: Color(0xFFFFDEAD),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFFDEAD),
    primaryContainer: Color(0xFF1CDEC9),
    secondary: Color(0xFF340041),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headlineMedium: GoogleFonts.openSans(fontWeight: _bold, fontSize: 48.0),
    bodySmall: GoogleFonts.dancingScript(
        fontWeight: _semiBold, fontSize: 24.0, color: const Color(0xFF340041)),
    headlineSmall: GoogleFonts.openSans(fontWeight: _medium, fontSize: 40.0),
    titleMedium: GoogleFonts.openSans(fontWeight: _medium, fontSize: 40.0),
    labelSmall: GoogleFonts.montserrat(fontWeight: _medium, fontSize: 20.0),
    bodyLarge: GoogleFonts.dancingScript(
        fontWeight: _regular, fontSize: 30.0, color: const Color(0xFF340041)),
    titleSmall: GoogleFonts.openSans(fontWeight: _medium, fontSize: 36.0),
    bodyMedium: GoogleFonts.dancingScript(
        fontWeight: _regular, fontSize: 24.0, color: const Color(0xFF340041)),
    titleLarge: GoogleFonts.openSans(fontWeight: _bold, fontSize: 48.0),
    labelLarge: GoogleFonts.montserrat(fontWeight: _semiBold, fontSize: 24.0),
  );
}
