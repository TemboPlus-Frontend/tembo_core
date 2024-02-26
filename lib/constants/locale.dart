import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tembo_core/utils/date_utils.dart';

enum TemboLocale {
  en("en_US", "US", "English"),
  sw("sw_TZ", "TZ", "Swahili"),
  ;

  const TemboLocale(this.languageCode, this.countryCode, this.name);
  final String name;
  final String languageCode;
  final String countryCode;

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "languageCode": languageCode,
      "countryCode": countryCode,
    };
  }

  Locale get locale => Locale(languageCode, countryCode);

  String toJson() => jsonEncode(toMap());

  static TemboLocale fromJson(String j) => TemboLocale.fromMap(jsonDecode(j));

  static TemboLocale fromMap(Map<String, dynamic> map) {
    final code = map["languageCode"];
    if (code == null) throw "Unknown Locale";

    final contained = ["en", "sw"].contains(code);
    if (!contained) throw "Unknown Locale";

    return TemboLocale.values.firstWhere((e) => e.languageCode == code);
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
