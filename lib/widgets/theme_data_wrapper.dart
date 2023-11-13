import 'package:flutter/material.dart';

import '../tembo_ui.dart';

/// Exposes the most recent [TemboThemeData] instance
class ThemeDataWrapper extends StatelessWidget {
  final Widget Function(BuildContext context, TemboThemeData themeData) builder;
  const ThemeDataWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TemboThemeData>(
      valueListenable: themeManager,
      builder: (context, themeData, child) {
        return Builder(
          builder: (context) {
            return builder(
              context,
              themeData,
            );
          }
        );
      },
    );
  }
}
