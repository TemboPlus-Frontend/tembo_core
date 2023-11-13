library tembo_ui;

export 'exports.dart';

import 'source.dart';

late final ThemeManager themeManager;
late final LocaleManager localeManager;

void init(
  BuildContext context, {
  /// Color scheme to be used for all components used in the SDK.
  /// Sets the language to be used.
  ///
  /// Only Swahili(sw) and English(en) are currently supported
  TemboLocale locale = TemboLocale.en,

  /// If themeMode is null, PlatformBrightness will be checked by using MediaQuery.platformBrightnessOf(context)
  TemboThemeMode? themeMode = TemboThemeMode.light,
}) {
  final themeData = _initThemeData(context, themeMode);
  _initThemeManager(themeData);
  _initLocaleManager(locale);
}

TemboThemeData _initThemeData(
  BuildContext context, [
  TemboThemeMode? themeMode,
]) {
  if (themeMode != null) return TemboThemeData.fromThemeMode(themeMode);

  var data = const TemboThemeData();

  var brightness = MediaQuery.platformBrightnessOf(context);
  bool isDarkMode = brightness == Brightness.dark;
  if (isDarkMode) {
    data = TemboThemeData.from(const TemboColorScheme.dark());
  }

  return data;
}

void _initLocaleManager(TemboLocale locale) {
  try {
    localeManager = LocaleManager(locale);
  } catch (_) {
    // handling LateInitializationError issues
    localeManager.updateLocale(locale);
  }
}

void _initThemeManager(TemboThemeData themeData) {
  try {
    themeManager = ThemeManager(themeData);
  } catch (_) {
    // handling LateInitializationError issues
    themeManager.updateTheme(themeData);
  }
}
