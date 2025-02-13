// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:tembo_core/tembo_core.dart';

enum TemboBorderStyle { underline, outline }

enum TemboTextFieldDecorationStyle { outline, filled }

const _defPadding = EdgeInsets.fromLTRB(20, 0, 20, 0);

class TemboTextFieldDecoration {
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final TextStyle? valueStyle;
  final String? hint, label;
  final double? borderWidth;
  final double? borderRadius;
  final Color? borderColor;
  final bool hasBorder;
  final Size? size;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TemboBorderStyle? borderStyle;
  final EdgeInsets? padding;

  final TemboTextFieldDecorationStyle _decorationStyle;

  const TemboTextFieldDecoration({
    this.fillColor,
    this.valueStyle,
    this.hintStyle,
    this.hint,
    this.label,
    this.labelStyle,
    this.borderWidth,
    this.borderRadius,
    this.borderColor,
    this.hasBorder = true,
    this.size,
    this.prefixIcon,
    this.suffixIcon,
    this.borderStyle = TemboBorderStyle.outline,
    this.padding,
    TemboTextFieldDecorationStyle decorationStyle =
        TemboTextFieldDecorationStyle.outline,
  }) : _decorationStyle = decorationStyle;

  const TemboTextFieldDecoration.filled({
    this.fillColor,
    this.valueStyle,
    this.hintStyle,
    this.hint,
    this.label,
    this.labelStyle,
    this.borderRadius,
    this.size,
    this.prefixIcon,
    this.suffixIcon,
    this.padding,
  }) : hasBorder = false,
       borderWidth = 0,
       borderColor = Colors.transparent,
       borderStyle = TemboBorderStyle.outline,
       _decorationStyle = TemboTextFieldDecorationStyle.filled;

  TemboTextFieldDecoration copyWith({
    Color? fillColor,
    String? hint,
    Widget? suffixIcon,
    Widget? prefixIcon,
    Color? borderColor,
    TextStyle? hintStyle,
    TextStyle? valueStyle,
  }) {
    return TemboTextFieldDecoration(
      fillColor: fillColor ?? this.fillColor,
      hint: hint ?? this.hint,
      hintStyle: hintStyle ?? this.hintStyle,
      valueStyle: valueStyle ?? this.valueStyle,
      borderColor: borderColor ?? this.borderColor,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      hasBorder: hasBorder,
      size: size,
      prefixIcon: prefixIcon ?? this.prefixIcon,
      label: label,
      labelStyle: labelStyle,
      borderStyle: borderStyle,
      padding: padding,
      suffixIcon: suffixIcon ?? this.suffixIcon,
      decorationStyle: _decorationStyle,
    );
  }

  TemboTextFieldDecoration copyFontFamily(String? fontFamily) {
    return copyWith(
      valueStyle: valueStyle?.copyWith(fontFamily: fontFamily),
      hintStyle: hintStyle?.copyWith(fontFamily: fontFamily),
    );
  }

  InputBorder border(BuildContext context) {
    final scheme = getColorScheme(context);
    final consts = getUIConstants();

    final defaultBorderWidth = consts.borderWidth;
    final defaultBorderRadius = consts.borderRadius;

    return hasBorder
        ? borderStyle == TemboBorderStyle.outline
            ? OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? defaultBorderRadius,
              ),
              borderSide: BorderSide(
                color: borderColor ?? scheme.outline,
                width: borderWidth ?? defaultBorderWidth,
              ),
            )
            : UnderlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderRadius ?? defaultBorderRadius,
              ),
              borderSide: BorderSide(
                color: borderColor ?? scheme.outline,
                width: borderWidth ?? defaultBorderWidth,
              ),
            )
        : InputBorder.none;
  }

  InputBorder get filledBorder {
    final consts = getUIConstants();
    final defaultBorderRadius = consts.borderRadius;

    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? defaultBorderRadius),
      borderSide: BorderSide(color: Colors.transparent, width: 0),
    );
  }

  TextStyle? getValueStyle(BuildContext context) {
    if (valueStyle != null) return valueStyle;

    final scheme = getColorScheme(context);
    final textstyle = getThemeData(context).textTheme.bodyMedium.bold;
    return textstyle.copyWith(color: scheme.onSurface);
  }

  TextStyle? getLabelStyle(BuildContext context) {
    if (labelStyle != null) return labelStyle;

    // final scheme = getColorScheme(context);
    // final textstyle = getThemeData(context).textTheme.bodyLarge.withFW500;
    // return textstyle.copyWith(color: scheme.onSurfaceVariant);
    return TemboLabel.getDefaultTextStyle(context);
  }

  TextStyle? getHintStyle(BuildContext context) {
    if (hintStyle != null) return hintStyle;

    final scheme = getColorScheme(context);
    final textstyle = getThemeData(context).textTheme.bodyMedium.withFW400;

    // if (_decorationStyle == TemboTextFieldDecorationStyle.filled) {
    //   return textstyle.copyWith(
    //       color: scheme.onSurface.withOpacity(.75));
    // }

    return textstyle.copyWith(color: scheme.onSurface.withValues(alpha: .75));
  }

  InputDecoration getInputDecoration(
    BuildContext context, {
    required bool enabled,
  }) {
    if (_decorationStyle == TemboTextFieldDecorationStyle.outline) {
      return getOutlineInputDecoration(context, enabled: enabled);
    }
    return getFilledInputDecoration(context, enabled: enabled);
  }

  InputDecoration getFilledInputDecoration(
    BuildContext context, {
    required bool enabled,
  }) {
    final scheme = getColorScheme(context);
    final consts = getUIConstants();

    final errorBorder = filledBorder.copyWith(
      borderSide: BorderSide(color: scheme.error, width: consts.borderWidth),
    );

    final disabledBorder = filledBorder.copyWith(
      borderSide: BorderSide(
        width: consts.borderWidth,
        color: scheme.outlineVariant,
      ),
    );

    final border = enabled ? filledBorder : disabledBorder;
    final error_border = enabled ? errorBorder : disabledBorder;

    final decoration = InputDecoration(
      isDense: false,
      border: border,
      enabledBorder: border,
      focusedBorder: border,
      disabledBorder: disabledBorder,
      focusedErrorBorder: error_border,
      errorBorder: error_border,
      filled: true,
      fillColor: fillColor ?? scheme.surfaceContainer,
      contentPadding: padding ?? _defPadding,
      hintStyle: getHintStyle(context),
      hintText: hint,
    );
    if (prefixIcon != null) {
      return decoration.copyWith(
        prefixIcon: IconTheme(
          data: IconThemeData(color: scheme.onSurfaceVariant),
          child: prefixIcon!,
        ),
      );
    }
    if (suffixIcon != null) {
      return decoration.copyWith(
        suffixIcon: IconTheme(
          data: IconThemeData(color: scheme.onSurfaceVariant),
          child: suffixIcon!,
        ),
      );
    }
    return decoration;
  }

  InputDecoration getOutlineInputDecoration(
    BuildContext context, {
    required bool enabled,
  }) {
    final scheme = getColorScheme(context);
    final consts = getUIConstants();

    final errorBorder = border(context).copyWith(
      borderSide: BorderSide(color: scheme.error, width: consts.borderWidth),
    );

    final disabledBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? consts.borderRadius),
      borderSide: BorderSide(
        width: consts.borderWidth,
        color: scheme.outlineVariant,
      ),
    );

    final normal_border = enabled ? border(context) : disabledBorder;
    final error_border = enabled ? errorBorder : disabledBorder;

    final decoration = InputDecoration(
      isDense: false,
      border: normal_border,
      enabledBorder: normal_border,
      focusedBorder: normal_border,
      disabledBorder: disabledBorder,
      focusedErrorBorder: error_border,
      errorBorder: error_border,
      filled: false,
      fillColor: null,
      contentPadding: padding ?? _defPadding,
      hintStyle: getHintStyle(context),
      hintText: hint,
    );
    if (prefixIcon != null) {
      return decoration.copyWith(
        prefixIcon: IconTheme(
          data: IconThemeData(color: scheme.onSurfaceVariant),
          child: prefixIcon!,
        ),
      );
    }
    if (suffixIcon != null) {
      return decoration.copyWith(
        suffixIcon: IconTheme(
          data: IconThemeData(color: scheme.onSurfaceVariant),
          child: suffixIcon!,
        ),
      );
    }
    return decoration;
  }

  static TemboTextFieldDecoration getDefaultAmountDeco(BuildContext context) {
    final scheme = getColorScheme(context);
    return TemboTextFieldDecoration(
      size: const Size.fromHeight(60),
      hasBorder: true,
      borderWidth: 2,
      borderStyle: TemboBorderStyle.underline,
      hint: "TZS 0",
      borderColor: scheme.outline,
      fillColor: Colors.transparent,
    );
  }

  static TemboTextFieldDecoration getDefaultFilledDeco(BuildContext context) {
    return TemboTextFieldDecoration.filled();
  }

  @override
  String toString() {
    return 'TemboTextFieldDecoration(fillColor: $fillColor, hintStyle: $hintStyle, labelStyle: $labelStyle, valueStyle: $valueStyle, label: $label, borderWidth: $borderWidth, borderRadius: $borderRadius, borderColor: $borderColor, hasBorder: $hasBorder, size: $size, prefixIcon: $prefixIcon, suffixIcon: $suffixIcon, borderStyle: $borderStyle, padding: $padding, _decorationStyle: $_decorationStyle)';
  }
}
