import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const googleFontFamiliy = 'Inter';
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
  static const opacity80Percent = 0.8;

  // Black
  static const black900 = Color(0xFF171717);

  static TextTheme customTextTheme = TextTheme(
    bodyMedium: GoogleFonts.getFont(
      googleFontFamiliy,
      fontSize: 15,
    ),
  );
}
