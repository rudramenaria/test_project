import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static TextStyle titleTextTheme() => GoogleFonts.raleway(
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );

  static TextStyle regularTextTheme() => GoogleFonts.raleway(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  ); 
}