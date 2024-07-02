import '../../constants/locale.dart';
import 'user_prefs_api.dart';

class LocaleAPI {
  LocaleAPI._();
  static final instance = LocaleAPI._();

  static final _api = UserPreferencesAPI.instance;

  static const _key = "locale";

  static TemboLocale getCurrentLocale() {
    try {
      final json = _api.get(_key);
      return TemboLocale.fromJson(json);
    } catch (_) {
      return TemboLocale.en;
    }
  }

  TemboLocale? getLocale() {
    try {
      final json = _api.get(_key);
      return TemboLocale.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> setLocale(TemboLocale locale) async {
    await _api.put(_key, locale.toJson());
  }
}
