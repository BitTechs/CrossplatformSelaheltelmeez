import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selaheltelmeez/widgets/buttons/fancy_elevated_button.dart';

class AppTheme{
  static get lightTheme  => ThemeData(
    textTheme: GoogleFonts.cairoTextTheme(),
  );
}

class CommonColors{
  static get fancyElevatedButtonBackGroundColor => const Color(0xffffd140);
  static get fancyElevatedTitleColor => const Color(0xff6e4672);
  static get fancyElevatedShadowTitleColor =>  Colors.white;
}