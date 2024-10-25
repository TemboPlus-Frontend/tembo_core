import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

final loopcardColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffF3F3E0),
  onPrimary: Colors.black,
  primaryContainer: Color.fromARGB(255, 242, 240, 240),
  onPrimaryContainer: Colors.black87,
  secondary: Color(0xFFFAE6FA),
  onSecondary: Colors.black,
  error: Colors.orangeAccent,
  onError: Colors.black,
  surface: Color(0xFF00308F),
  onSurface: Colors.white,
  surfaceContainer: Color(0xffccd6e9),
  onSurfaceVariant: Colors.black,
  onInverseSurface: Colors.white70,
);

final loopcardTheme = ThemeData(
  colorScheme: loopcardColorScheme,
  useMaterial3: true,
  fontFamily: fonts.markPro,
);
