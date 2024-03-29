import 'package:flutter/material.dart';
import 'package:tembo_core/constants/source.dart';
import 'package:tembo_core/extensions/source.dart';

import 'text.dart';

class TemboLabel extends StatelessWidget {
  final String label;
  final double? bottomSpacing;
  final TextStyle? style;

  const TemboLabel(
    this.label, {
    this.bottomSpacing = 10.0,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bottom(bottomSpacing),
      child: TemboText(
        label,
        style: style ??
            context.textTheme.bodyMedium.withFW500.withColor(
              context.colorScheme.onSurface,
            ),
      ),
    );
  }
}
