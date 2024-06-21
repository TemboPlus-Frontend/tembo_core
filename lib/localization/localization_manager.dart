import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/locale.dart';
import 'locale_api.dart';

typedef LocManagerProvider = StateNotifierProvider<LocalizationManager, TemboLocale>;

final localeManagerProvider = LocManagerProvider((r) => LocalizationManager(r));

class LocalizationManager extends StateNotifier<TemboLocale> {
  final StateNotifierProviderRef ref;
  LocalizationManager(this.ref) : super(TemboLocale.en) {
    if (hasChosenLocaleAlready()) {
      state = _api.getLocale()!;
    }
  }

  final _api = LocaleAPI.instance;

  bool hasChosenLocaleAlready() {
    final locale = _api.getLocale();
    return locale != null;
  }

  Future<void> update(TemboLocale e) async {
    await _api.setLocale(e);
    state = e;
  }
}
