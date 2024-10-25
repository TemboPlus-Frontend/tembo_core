import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';

const temboColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF00308F),
  onPrimary: Colors.white,
  primaryContainer: Color.fromARGB(255, 221, 234, 243),
  onPrimaryContainer: Colors.black87,
  secondary: Color(0xff78184A),
  onSecondary: Colors.white,
  error: Color(0xff841617),
  onError: Colors.white,
  surface: Color(0xfff4f5f8),
  onSurface: Color.fromARGB(255, 93, 93, 93),
  surfaceContainer: Color(0xffe6e6e6),
  onSurfaceVariant: Color.fromARGB(255, 93, 93, 93),
  onInverseSurface: Colors.black87,
);

// final temboColorScheme = ColorScheme.fromSeed(
//   seedColor: Color(0xFF00308F),
// );

final temboTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fonts.markPro,
  colorScheme: temboColorScheme,
);
