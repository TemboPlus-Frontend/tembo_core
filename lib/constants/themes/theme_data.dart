// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../styles/box_decoration.dart';
import '../../styles/source.dart';
import '../colors.dart';
import '../constants.dart';

part 'styles.dart';

/// For styling custom package components
class TemboThemeData {
  final String fontFamily;

  final TemboThemeMode themeMode;

  final TemboColorScheme colorScheme;

  /// Applies to all page titles
  final TextStyle pageTitleStyle;

  /// Applies to all selected option buttons
  final TemboButtonStyle selectedOptionButtonStyle;

  /// Applies to all un-selected option buttons
  final TemboButtonStyle unselectedOptionButtonStyle;

  /// Applies to all bottom nav-bar buttons
  final TemboButtonStyle bottomNavBarButtonStyle;

  /// Applies to all date pickers
  final TemboDatePickerDecoration datePickerDecoration;

  /// Applies to all text-fields
  final TemboTextFieldDecoration textFieldDecoration;

  /// Applies to the labelled form fields in the data verification before submission page
  final TemboLabelledFormFieldDecoration labelledFormFieldDecoration;

  const TemboThemeData._({
    required this.colorScheme,
    required this.bottomNavBarButtonStyle,
    required this.datePickerDecoration,
    required this.fontFamily,
    required this.labelledFormFieldDecoration,
    required this.pageTitleStyle,
    required this.selectedOptionButtonStyle,
    required this.textFieldDecoration,
    required this.themeMode,
    required this.unselectedOptionButtonStyle,
  });

  factory TemboThemeData.from(TemboThemeMode themeMode) {
    if (themeMode == TemboThemeMode.dark) {
      return TemboThemeData.dark();
    }

    return const TemboThemeData.light();
  }

  const TemboThemeData.light({
    this.colorScheme = const TemboColorScheme.light(),
    this.pageTitleStyle = _pageTitleStyle,
    this.selectedOptionButtonStyle = _selectedOptionButtonStyle,
    this.unselectedOptionButtonStyle = _unselectedOptionButtonStyle,
    this.bottomNavBarButtonStyle = _bottomNavBarStyle,
    this.datePickerDecoration = _datePickerStyle,
    this.textFieldDecoration = _textFieldDecoration,
    this.labelledFormFieldDecoration = _labelledFormFieldDecoration,
  })  : fontFamily = kFontFamily,
        themeMode = TemboThemeMode.light;

  factory TemboThemeData.dark() {
    const scheme = TemboColorScheme.dark();

    return TemboThemeData._(
      colorScheme: scheme,
      fontFamily: kFontFamily,
      themeMode: TemboThemeMode.dark,
      pageTitleStyle: _pageTitleStyle.copyWith(color: scheme.title),
      selectedOptionButtonStyle: _selectedOptionButtonStyle.copyWith(
        backgroundColor: scheme.surfaceContainer,
        borderColor: scheme.primary,
        foregroundColor: scheme.primary,
      ),
      unselectedOptionButtonStyle: _unselectedOptionButtonStyle.copyWith(
        borderColor: scheme.border,
        backgroundColor: scheme.surfaceContainer,
        foregroundColor: scheme.onSurfaceContainer,
      ),
      bottomNavBarButtonStyle: _bottomNavBarStyle.copyWith(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
      ),
      datePickerDecoration: _datePickerStyle.copyWith(
        hintStyle: _datePickerHintStyle.copyWith(
          color: scheme.hint,
        ),
        buttonStyle: _datePickerStyle.buttonStyle?.copyWith(
          backgroundColor: scheme.surfaceContainer,
          foregroundColor: scheme.onBackground,
          borderColor: scheme.surfaceContainer,
        ),
      ),
      textFieldDecoration: _textFieldDecoration.copyWith(
        borderColor: scheme.surfaceContainer,
        fillColor: scheme.surfaceContainer,
        hintStyle: _textFieldHintStyle.copyWith(
          color: scheme.hint,
        ),
        valueStyle: _textFieldValueStyle.copyWith(
          color: scheme.onBackground,
        ),
      ),
      labelledFormFieldDecoration: _labelledFormFieldDecoration.copyWith(
        labelTextStyle: _labelledFormFieldDecoration.labelTextStyle?.copyWith(
          color: scheme.hint,
        ),
        valueTextStyle: _labelledFormFieldDecoration.valueTextStyle?.copyWith(
          color: scheme.onBackground,
        ),
        boxDecoration: _labelledFormFieldDecoration.boxDecoration?.copyWith(
          color: scheme.surfaceContainer,
        ),
      ),
    );
  }
}
