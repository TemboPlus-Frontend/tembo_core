import 'dart:convert';

import 'package:flutter/material.dart';

import '../constants/locale.dart';

const swLocale = Locale("sw", "TZ");
const enLocale = Locale("en", "US");

extension LocaleExt on Locale {
  bool get _isTZ => countryCode == "TZ";
  // bool get _isUK => countryCode == "UK";

  String get flag => _isTZ ? "🇹🇿" : "🇬🇧";
  String get language => _isTZ ? "Swahili" : "English";

  bool get isEN => languageCode == enLocale.languageCode;
  bool get isSW => languageCode == swLocale.languageCode;

  TemboLocale get toTemboLocale {
    return isSW ? TemboLocale.sw : TemboLocale.en;
  }

  String toJson() {
    final map = {
      "country_code": countryCode,
      "lang_code": languageCode,
    };
    return jsonEncode(map);
  }
}
