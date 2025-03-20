import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightPurpleTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xff8CC2F4),
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Color.fromARGB(255, 251, 252, 255),
    appBarTheme: AppBarTheme(
      backgroundColor: const Color.fromARGB(255, 205, 190, 231),
      elevation: 0,
      scrolledUnderElevation: 0,
      iconTheme: IconThemeData(color: Colors.deepPurple.shade800),
      toolbarHeight: 64,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 22, // Increased font size for better visibility
        fontWeight: FontWeight.bold, // Set to bold for a stronger emphasis
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    textTheme: GoogleFonts.ralewayTextTheme(
      Theme.of(context).textTheme,
    ).copyWith(
      headlineSmall: GoogleFonts.inter(
        fontSize: 14, // Increased font size
        fontWeight: FontWeight.bold, // Set to bold
        color: const Color(0xff8CC2F4),
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 28, // Increased font size
        fontWeight: FontWeight.w900, // Set to bold
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 35, // Increased font size
        fontWeight: FontWeight.bold, // Set to bold
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 18, // Increased font size
        fontWeight: FontWeight.bold, // Set to bold
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 16, // Increased font size
        fontWeight: FontWeight.bold, // Set to bold
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 16, // Increased font size
        fontWeight: FontWeight.bold, // Set to bold
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 14, // Increased font size
        fontWeight: FontWeight.bold, // Set to bold
        color: const Color.fromARGB(255, 0, 0, 0),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 2.1,
        ),
      ),
      filled: true,
      fillColor: Color(0xffEBEBEB),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(
          color: const Color.fromARGB(255, 0, 0, 0),
          width: 3,
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
        backgroundColor: const Color.fromARGB(255, 123, 183, 240),
        fixedSize: Size(
          MediaQuery.of(context).size.height * 0.2,
          MediaQuery.of(context).size.width * 0.18,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(9), // Square corners
        ),
        textStyle: Theme.of(context).textTheme.headlineLarge,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: const Color.fromARGB(255, 131, 188, 241),
      foregroundColor: Colors.white,
    ),

    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(Colors.deepPurple),
    ),
  );
}
