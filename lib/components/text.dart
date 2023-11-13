import 'package:flutter/material.dart';

import '../widgets/theme_data_wrapper.dart';

class TemboText extends StatelessWidget {
  const TemboText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  final String data;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ThemeDataWrapper(builder: (context, theme) {
      return Text(
        data,
        style: style ??
            DefaultTextStyle.of(context).style.copyWith(
                  fontFamily: theme.fontFamily,
                ),
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        textScaleFactor: 1.0,
      );
    });
  }
}
