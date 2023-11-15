import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tembo_ui/source.dart';
import 'package:tembo_ui/tembo_ui.dart';

void popBackToPrevApp() {
  rootNavKey.popToFirstPage();
  lastNavManager.value.pop();
}

Future<T?> pushApp<T>(BuildContext context, String name, Widget page) async {
  return await Navigator.of(context).push(MaterialPageRoute(
    settings: RouteSettings(name: name),
    builder: (context) {
      return ValueListenableBuilder(
        valueListenable: localeManager,
        builder: (context, temboLocale, _) {
          return ValueListenableBuilder(
              valueListenable: themeManager,
              builder: (context, theme, _) {
                return ProviderScope(
                  child: MaterialApp(
                    home: page,
                    navigatorKey: rootNavKey,
                    locale: temboLocale.locale,
                    debugShowCheckedModeBanner: false,
                    theme: theme.mode.isLight ? _lightTheme : _darkTheme,
                    scaffoldMessengerKey: rootScaffoldMessengerKey,
                    localizationsDelegates:
                        AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                  ),
                );
              });
        },
      );
    },
  ));
}

final _lightTheme = _colorScheme.toTheme;
final _darkTheme = _darkColorScheme.toTheme;

final _colorScheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  appBarBackground: LightTemboColors.background,
  primary: LightTemboColors.primary,
  onPrimary: LightTemboColors.onPrimary,
  error: LightTemboColors.error,
  onError: LightTemboColors.onError,
  background: LightTemboColors.background,
  scaffoldBackground: LightTemboColors.background,
  surface: LightTemboColors.surface,
  onSurface: LightTemboColors.onSurface,
  onBackground: Colors.black,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);

final _darkColorScheme = FlexColorScheme.dark(
  fontFamily: kFontFamily,
  primary: DarkTemboColors.primary,
  onPrimary: DarkTemboColors.onPrimary,
  appBarBackground: DarkTemboColors.background,
  error: DarkTemboColors.error,
  onError: DarkTemboColors.onError,
  background: DarkTemboColors.background,
  scaffoldBackground: DarkTemboColors.background,
  surface: DarkTemboColors.surface,
  onSurface: DarkTemboColors.onSurface,
  onBackground: Colors.black,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  appBarStyle: FlexAppBarStyle.material,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);
