import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Headings (H1, H2, H3)
  static TextStyle h1({double? size, Color color = Colors.white, FontWeight weight = FontWeight.bold}) {
    return GoogleFonts.poppins(fontSize: size ?? 48, color: color, fontWeight: weight);
  }

  static TextStyle h2({double? size, Color color = Colors.white, FontWeight weight = FontWeight.bold}) {
    return GoogleFonts.poppins(fontSize: size ?? 36, color: color, fontWeight: weight);
  }

  static TextStyle h3({double? size, Color color = Colors.white, FontWeight weight = FontWeight.bold}) {
    return GoogleFonts.poppins(fontSize: size ?? 28, color: color, fontWeight: weight);
  }

  // Subheadings / highlights
  static TextStyle subHeading({double? size, Color color = Colors.orange, FontWeight weight = FontWeight.w600}) {
    return GoogleFonts.poppins(fontSize: size ?? 24, color: color, fontWeight: weight);
  }

  // Body text (normal paragraphs)
  static TextStyle body({double? size, Color color = Colors.white70, FontWeight weight = FontWeight.normal}) {
    return GoogleFonts.poppins(fontSize: size ?? 16, color: color, fontWeight: weight);
  }

  // Small body text / captions
  static TextStyle caption({double? size, Color color = Colors.white60, FontWeight weight = FontWeight.normal}) {
    return GoogleFonts.poppins(fontSize: size ?? 14, color: color, fontWeight: weight);
  }

  // Labels / small text on buttons or inputs
  static TextStyle label({double? size, Color color = Colors.white, FontWeight weight = FontWeight.w500}) {
    return GoogleFonts.poppins(fontSize: size ?? 12, color: color, fontWeight: weight);
  }

  // Button text
  static TextStyle button({double? size, Color color = Colors.white, FontWeight weight = FontWeight.bold}) {
    return GoogleFonts.poppins(fontSize: size ?? 16, color: color, fontWeight: weight);
  }

  // Overline / extra small text
  static TextStyle overline({double? size, Color color = Colors.white54, FontWeight weight = FontWeight.w400}) {
    return GoogleFonts.poppins(fontSize: size ?? 10, color: color, fontWeight: weight, letterSpacing: 1.5);
  }

  // Custom size utility (any size you want)
  static TextStyle custom({double? size, Color color = Colors.white, FontWeight weight = FontWeight.normal}) {
    return GoogleFonts.poppins(fontSize: size ?? 16, color: color, fontWeight: weight);
  }
}
