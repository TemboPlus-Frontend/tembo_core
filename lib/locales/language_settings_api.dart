import 'package:tembo_ui/tembo_ui.dart';

import '../user_preferences/user_preferences_api.dart';

class LanguageSettingsAPI {
  final prefsAPI = UserPreferencesAPI.instance;

  TemboLocale? get currentLocale {
    final json = prefsAPI.get("locale");
    if (json == null) return null;
    try {
      return TemboLocale.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> saveLocale(TemboLocale locale) async {
    await prefsAPI.put("locale", locale.toJson());
  }
}
