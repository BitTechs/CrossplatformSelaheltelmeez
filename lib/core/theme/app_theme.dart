import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selaheltelmeez/core/theme/common_colors.dart';

class AppTheme{
  static get lightTheme  => ThemeData(
    textTheme: GoogleFonts.cairoTextTheme(),
    appBarTheme: const AppBarTheme(
      elevation: 0.0,
    ),
  );

  static get screenTitle => const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
  );
}
