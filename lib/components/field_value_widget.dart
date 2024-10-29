import 'package:flutter/material.dart';
import 'package:tembo_core/components/source.dart';
import 'package:tembo_core/extensions/source.dart';

import '../app/app.dart';
import '../constants/source.dart';
import '../widgets/source.dart';

class TemboFVWidget extends StatelessWidget {
  final num breakpoint;
  final String field, value;
  final Widget? icon;
  final TextStyle? fieldStyle, valueStyle;
  final int valueMaxLines;

  const TemboFVWidget({
    this.breakpoint = 300,
    required this.field,
    required this.value,
    this.fieldStyle,
    this.valueStyle,
    this.valueMaxLines = 1,
    this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BreakPointsBuilder.for1BreakPoint(
        b1: breakpoint,
        onB1: (context, constr) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildField(),
              vSpace(10),
              buildValue(),
            ],
          );
        },
        onGreaterThanB1: (context, constr) {
          return Row(
            children: [
              buildField(),
              hSpace(),
              Expanded(child: buildValue()),
            ],
          );
        });
  }

  Widget buildField() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          Padding(
            padding: right(),
            child: icon!,
          ),
        Builder(builder: (context) {
          final scheme = getColorScheme(context);

          return TemboText(
            field,
            style: fieldStyle ??
                context.textTheme.bodyMedium.withColor(
                  scheme.onSurface,
                ),
          );
        }),
      ],
    );
  }

  Widget buildValue() {
    return Builder(builder: (context) {
      final scheme = getColorScheme(context);

      return TemboText(
        value,
        maxLines: valueMaxLines,
        textAlign: TextAlign.end,
        style: valueStyle ??
            context.textTheme.bodyMedium.withFW500.withColor(
              scheme.onSurface,
            ),
      );
    });
  }
}
