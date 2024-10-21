// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../tembo_core.dart';

const _textStyle = TextStyle(
  fontSize: 25,
  color: Colors.black,
);

const _hintStyle = TextStyle(
  fontSize: 16,
  color: Colors.black54,
  fontWeight: FontWeight.bold,
);

final TEXTFIELDS_DECO = TemboTextFieldDecoration(
  size: const Size.fromHeight(70),
  fillColor: getTemboColorScheme().primaryContainer,
  padding: horizontal(),
  labelStyle: _textStyle,
  valueStyle: _textStyle,
  hintStyle: _hintStyle,
  borderRadius: kBorderRadius3,
  borderWidth: 1.5,
);

final DATE_PICKER_DECO = TemboButtonStyle(
  height: 70,
  padding: horizontal(),
  borderRadius: kBorderRadius3,
  textStyle: _textStyle,
  backgroundColor: getTemboColorScheme().primaryContainer,
  foregroundColor: getTemboColorScheme().onPrimaryContainer,
  borderColor: getTemboColorScheme().border,
  borderWidth: 1.5,
);

const DATE_PICKER_HINT_STYLE = _hintStyle;
