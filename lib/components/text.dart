import '/extensions/context_extension.dart';
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

  TemboText.headlineMedium(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.displayMedium?.copyWith(color: color),
        _weight = weight;

  TemboText.bodyLarge(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.bodyLarge?.copyWith(color: color),
        _weight = weight;

  TemboText.titleLarge(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.titleLarge?.copyWith(color: color),
        _weight = weight;

  TemboText.titleMedium(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.titleMedium?.copyWith(color: color),
        _weight = weight;

  TemboText.bodyMedium(
    BuildContext context,
    this.data, {
    super.key,
    this.textAlign,
    this.overflow,
    this.maxLines,
    FontWeight? weight,
    Color? color,
  })  : style = context.textTheme.bodyMedium?.copyWith(color: color),
        _weight = weight;

  final String data;

  final TextStyle? style;

  final TextAlign? textAlign;

  final TextOverflow? overflow;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    final textstyle = style ?? DefaultTextStyle.of(context).style;
    final ff = textstyle.fontFamily ?? fonts.markPro;

    return Text(
      data,
      style: textstyle.copyWith(fontWeight: _weight, fontFamily: ff),
      textAlign: textAlign,
      overflow: maxLines != null && maxLines != 0 && overflow == null
          ? TextOverflow.ellipsis
          : overflow,
      maxLines: maxLines,
      textScaler: const TextScaler.linear(1.0),
    );
  }
}
