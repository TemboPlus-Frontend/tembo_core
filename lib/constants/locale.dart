import 'package:flutter/material.dart';
import 'package:tembo_core/api/user_prefs_apis/locale_api.dart';
import 'package:tembo_core/utils/date_utils.dart';

enum TemboLocale {
  en("en", "US", "English"),
  sw("sw", "TZ", "Swahili"),
  ;

  const TemboLocale(this.languageCode, this.countryCode, this.label);
  final String label;
  final String languageCode;
  final String countryCode;

  Locale get locale => Locale(languageCode, countryCode);

  String toJson() => languageCode;

  static TemboLocale fromJson(String j) {
    return TemboLocale.values.firstWhere((e) => e.languageCode == j);
  }

  @override
  String toString() {
    return "Locale(languageCode: $languageCode, countryCode: $countryCode)";
  }
}

extension TemboLocaleExt on TemboLocale {
  bool get isSW => this == TemboLocale.sw;

  bool get isEN => this == TemboLocale.en;

  String formatDate(DateTime date,
      [String pattern = "dd/MM/yyyy hh:mm:ss aa"]) {
    return date.localizedFormat(this, pattern);
  }
}

TemboLocale getCurrentLocale() {
  return LocaleAPI.instance.getLocale() ?? TemboLocale.en;
}
