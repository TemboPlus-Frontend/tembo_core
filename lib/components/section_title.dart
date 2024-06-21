import 'package:flutter/material.dart';
import 'package:tembo_core/extensions/source.dart';

import '../constants/constants.dart';
import 'text.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  const SectionTitle(this.title, {super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? zero,
      child: TemboText(
        title,
        style: context.textTheme.titleMedium.withColor(
          context.colorScheme.primaryFixedDim,
        ),
      ),
    );
  }
}
