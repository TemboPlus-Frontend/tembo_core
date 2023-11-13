import 'package:flutter/material.dart';
import '/components/text.dart';

import 'source.dart';

/// Widget for all page titles
class PageTitle extends StatelessWidget {
  final String title;
  const PageTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ThemeDataWrapper(
      builder: (context, theme) {
        return TemboText(
          title,
          style: theme.pageTitleStyle,
        );
      },
    );
  }
}
