import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemesModeData {
  // light mode
  final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.black),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.black),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
  );

  // dark mode
  final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    primaryColor: Colors.blue,
    appBarTheme: AppBarTheme(
      backgroundColor: Color.fromARGB(255, 21, 21, 21),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
    scaffoldBackgroundColor: Color.fromARGB(255, 21, 21, 21),
  );
}
