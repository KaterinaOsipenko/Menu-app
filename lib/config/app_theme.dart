import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      textTheme: TextTheme(
        headlineMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        headlineSmall: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        headlineLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.w600,
          ),
        ),
        titleLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
        titleSmall: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        titleMedium: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        bodySmall: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 14,
          ),
        ),
        bodyLarge: GoogleFonts.montserrat(
          textStyle: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      colorScheme: const ColorScheme.light(
        primaryContainer: Color.fromRGBO(174, 175, 247, 1),
        primary: Color.fromRGBO(100, 74, 181, 1),
        onPrimary: Color.fromRGBO(255, 255, 255, 1),
        background: Color.fromRGBO(255, 255, 255, 1),
        secondary: Color.fromRGBO(0, 0, 0, 1),
        tertiary: Color.fromRGBO(55, 27, 52, 1),
      ),
    );
  }
}
