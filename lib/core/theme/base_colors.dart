import 'package:flutter/material.dart';

class BaseColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static const int _green = 0xFF27B688;
  static const int _dark = 0xFF083341;

  static const MaterialColor green = MaterialColor(
    _green,
    <int, Color>{
      300: Color(0xFF98D0AC),
      500: Color(_green),
    },
  );

  static const MaterialColor darkBlue = MaterialColor(_dark, <int, Color>{
    300: Color(_dark),
    500: Color(0x010101),
  });
}
