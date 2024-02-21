import 'package:tembo_core/api/user_preferences_api.dart';

enum TemboApp {
  lipaChina,
  temboPlus,
}

Future<void> registerApp(TemboApp app) =>
    UserPreferencesAPI.instance.put("app", app.name);

TemboApp getApp() {
  final json = UserPreferencesAPI.instance.get("app");
  if (json == null) {
    return TemboApp.temboPlus;
  }
  return TemboApp.values
      .firstWhere((e) => e.name == json, orElse: () => TemboApp.temboPlus);
}

