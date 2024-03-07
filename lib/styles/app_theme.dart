import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const googleFontFamily = 'Inter';
  // Alpha values
  static const alpha4Percent = 10;
  static const alpha8Percent = 20;
  static const alpha12Percent = 31;
  static const alpha36Percent = 94;

  // Opacity values
  static const opacity4Percent = 0.04;
  static const opacity8Percent = 0.08;
  static const opacity12Percent = 0.12;
  static const opacity36Percent = 0.36;
  static const opacity46Percent = 0.46;
  static const opacity80Percent = 0.8;
  static const opacity85Percent = 0.85;
  static const opacity90Percent = 0.9;

  // Black
  static const black900 = Color(0xFF171717);

  static TextTheme customTextTheme = TextTheme(
    bodyMedium: GoogleFonts.getFont(
      googleFontFamily,
      fontSize: 15,
    ),
    titleLarge: GoogleFonts.getFont(
      googleFontFamily,
      fontSize: 20,
    ),
  );
}
