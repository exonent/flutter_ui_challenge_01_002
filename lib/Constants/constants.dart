import 'package:flutter/material.dart';

class changeTheme {
  static bool theme = false;

// #######  Light Theme
  Color cambiarTemplate(String tipo) {
    switch (tipo) {
      case "background":
        return theme ? const Color(0xFFFFFFFF) : const Color(0xFF333132);
      case "title":
        return theme ? const Color(0xFFF5F5F5) : const Color(0xFF2B292A);
      case "navbar":
        return theme ? const Color(0xFFFEFEFE) : const Color(0xFF000000);
      case "textColor":
        return theme ? const Color(0xFF4F4F4F) : const Color(0xFFE6E6E6);
      default:
        return const Color(0xFFF5F5F5);
    }
  }
}

// #######  Common Theme
const kPinkBackgroud = Color(0xFFFF006B);
const kIconsBackground = Color(0xFFB42D6A);
