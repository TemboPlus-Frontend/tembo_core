import 'package:flutter/material.dart';

import '../constants/constants.dart';

class TemboText extends StatelessWidget {
  const TemboText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  }) : _weight = null;

  final FontWeight? _weight;

  const TemboText.center(
    this.data, {
    super.key,
    this.style,
    this.overflow,
    this.maxLines,
  })  : textAlign = TextAlign.center,
        _weight = null;

  const TemboText.bold(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
  }) : _weight = FontWeight.bold;

  const TemboText.w300(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
  }) : _weight = FontWeight.w300;

  const TemboText.w400(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
  }) : _weight = FontWeight.w400;

  const TemboText.w500(
    this.data, {
    super.key,
    this.textAlign,
    this.style,
    this.overflow,
    this.maxLines,
  }) : _weight = FontWeight.w500;

  final String data;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final textstyle = style ?? DefaultTextStyle.of(context).style;

    return Text(
      data,
      style: textstyle.copyWith(fontWeight: _weight, fontFamily: kFontFamily),
      textAlign: textAlign,
      overflow: maxLines != null && maxLines != 0 && overflow == null
          ? TextOverflow.ellipsis
          : overflow,
      maxLines: maxLines,
      textScaler: const TextScaler.linear(1.0),
    );
  }
}
