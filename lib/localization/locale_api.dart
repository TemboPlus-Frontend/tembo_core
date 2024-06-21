import '../api/base_local_api.dart';
import '../api/user_preferences_api.dart';
import '../constants/locale.dart';

class LocaleAPI extends BaseLocalAPI {
  LocaleAPI._();
  static final instance = LocaleAPI._();

  final _api = UserPreferencesAPI.instance;

  static TemboLocale getCurrentLocale() {
    try {
      final json = UserPreferencesAPI.instance.get("locale");
      return TemboLocale.fromJson(json);
    } catch (_) {
      return TemboLocale.en;
    }
  }

  TemboLocale? getLocale() {
    try {
      final json = _api.get("locale");
      return TemboLocale.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> setLocale(TemboLocale locale) async {
    await _api.put("locale", locale.toJson());
  }
}
