// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonMethod {
  ThemeData themedata = ThemeData(
      primaryColor: const Color(0xff64E54C),
      fontFamily: GoogleFonts.varela().fontFamily,
      appBarTheme: const AppBarTheme(
        color: Color(0xff64E54C),
      ),
      primarySwatch: Colors.green,
      scaffoldBackgroundColor: const Color(0xff181920),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontSize: 24.0),
        bodyMedium: TextStyle(fontSize: 24.0),
      ).apply(
        bodyColor:const Color(0xff64E54C),)
      );
}

final ButtonStyle button1 = ElevatedButton.styleFrom(
    primary: const Color(0xff64E54C),
    onPrimary: const Color(0xff181920),
    minimumSize: const Size(140, 50),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    textStyle: const TextStyle(fontSize: 19));

