import 'package:flutter/material.dart';

import '../constants/locale.dart';

class LocaleManager extends ValueNotifier<TemboLocale> {
  LocaleManager(super.data);

  void updateLocale(TemboLocale locale) {
    value = locale;
    notifyListeners();
  }
}
