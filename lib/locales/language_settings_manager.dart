import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/locale.dart';
import 'language_settings_api.dart';

final localesManagerProvider =
    StateNotifierProvider<LocaleManager, TemboLocale>((_) => LocaleManager());

class LocaleManager extends StateNotifier<TemboLocale> {
  LocaleManager() : super(TemboLocale.en);

  final _api = LanguageSettingsAPI();

  Future<void> updateLocale(TemboLocale locale) async {
    await _api.saveLocale(locale);
    state = locale;
  }
}
