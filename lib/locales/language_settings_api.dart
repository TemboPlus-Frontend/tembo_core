import 'package:tembo_core/tembo_core.dart';

class LanguageSettingsAPI {
  final prefsAPI = UserPreferencesAPI.instance;

  TemboLocale? get currentLocale {
    try {
      final json = prefsAPI.get("locale");
      if (json == null) return null;
      return TemboLocale.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveLocale(TemboLocale locale) async {
    await prefsAPI.put("locale", locale.toJson());
  }
}
