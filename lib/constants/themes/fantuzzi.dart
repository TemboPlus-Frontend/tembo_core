import 'package:flutter/material.dart';

import '../constants.dart';

final fantuzziColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffd8202a),
  onPrimary: Colors.white,
  primaryContainer: Color(0xfffbe9ea),
  onPrimaryContainer: Colors.black87,
  secondary: Color(0xff78184A),
  onSecondary: Colors.white,
  error: Color(0xff841617),
  onError: Colors.white,
  surface: Color(0xfff4f5f8),
  onSurface: Color.fromARGB(255, 93, 93, 93),
  surfaceContainer: Color(0xffF8F8F8),
  onSurfaceVariant: Color.fromARGB(255, 93, 93, 93),
);

final fantuzziTheme = ThemeData(
  useMaterial3: true,
  fontFamily: fonts.markPro,
  colorScheme: fantuzziColorScheme,
);
