import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

enum TemboBorderStyle { underline, outline }

class TemboTextFieldDecoration {
  final Color? fillColor;
  final TextStyle hintStyle;
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

  const TemboTextFieldDecoration({
    this.fillColor,
    this.hintStyle = const TextStyle(
      color: TemboColors.onSurface,
      fontWeight: FontWeight.w400,
      fontSize: 15,
    ),
    this.valueStyle = const TextStyle(
      color: TemboColors.onBackground,
      fontWeight: FontWeight.w500,
      fontSize: 15,
    ),
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
  });

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
      valueStyle: valueStyle ?? this.valueStyle,
    );
  }

  TemboTextFieldDecoration copyFontFamily(String? fontFamily) {
    return copyWith(
      valueStyle: valueStyle?.copyWith(fontFamily: fontFamily),
      hintStyle: hintStyle.copyWith(fontFamily: fontFamily),
    );
  }

  InputBorder get border {
    final scheme = getTemboColorScheme();
    return hasBorder
        ? borderStyle == TemboBorderStyle.outline
            ? OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? kBorderRadius3),
                borderSide: BorderSide(
                  color: borderColor ?? scheme.border ?? TemboColors.border,
                  width: borderWidth ?? 1.5,
                ),
              )
            : UnderlineInputBorder(
                borderRadius:
                    BorderRadius.circular(borderRadius ?? kBorderRadius3),
                borderSide: BorderSide(
                  color: borderColor ?? TemboColors.background,
                  width: borderWidth ?? 1.0,
                ),
              )
        : InputBorder.none;
  }

  InputDecoration get getInputDecoration {
    final scheme = getTemboColorScheme();

    final decoration = InputDecoration(
      isDense: false,
      border: border,
      enabledBorder: border,
      focusedBorder: border.copyWith(
        borderSide: BorderSide(
          color: scheme.primary ?? TemboColors.primary,
          width: border.borderSide.width,
        ),
      ),
      focusedErrorBorder: border,
      errorBorder: border.copyWith(
        borderSide: BorderSide(
          color: scheme.error ?? TemboColors.error,
          width: border.borderSide.width,
        ),
      ),
      disabledBorder: border,
      filled: fillColor != null,
      fillColor: fillColor,
      contentPadding: padding ?? const EdgeInsets.fromLTRB(12, 0, 12, 0),
      hintStyle: hintStyle,
      hintText: hint,
      label: label == null ? null : Text(label!, style: labelStyle),
    );
    if (prefixIcon != null) return decoration.copyWith(prefixIcon: prefixIcon);
    if (suffixIcon != null) return decoration.copyWith(suffixIcon: suffixIcon);
    return decoration;
  }

  static TemboTextFieldDecoration getDefaultAmountDeco(BuildContext context) {
    return TemboTextFieldDecoration(
      size: const Size.fromHeight(60),
      borderStyle: TemboBorderStyle.underline,
      hintStyle:
          context.textTheme.titleLarge.bold.withColor(Colors.grey.shade500),
      valueStyle: context.textTheme.titleLarge.bold.copyWith(
        color: context.colorScheme.onSurface,
      ),
      hint: "TZS 0",
      hasBorder: true,
      borderWidth: 2,
      borderColor: Colors.black45,
      fillColor: Colors.transparent,
    );
  }
}
