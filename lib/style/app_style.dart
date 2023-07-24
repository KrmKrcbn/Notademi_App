import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Appstyle {
  static Color bgColor = Color(0xff21254A);
  static Color mainColor = Color.fromARGB(255, 255, 171, 16);
  static Color accentColor = Color.fromARGB(255, 16, 194, 6);

  static List<Color> cardsColor = [
    Colors.white,
    Colors.blue.shade100,
    Colors.orange.shade100,
    Colors.red.shade100,
    Colors.pink.shade100,
    Colors.lime.shade100,
    Colors.teal.shade100,
    Colors.blueGrey.shade100,
  ];

  static TextStyle mainTitle =
      GoogleFonts.roboto(fontSize: 16.0, fontWeight: FontWeight.bold);

  static TextStyle mainContent =
      GoogleFonts.roboto(fontSize: 18.0, fontWeight: FontWeight.bold);

  static TextStyle dateTitle =
      GoogleFonts.roboto(fontSize: 13.0, fontWeight: FontWeight.bold);
}
