import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:tembo_core/constants/source.dart';

final theme = _flexColorCheme.toTheme;

const kFontFamily = "IBMPlexSans";
const colorScheme = TemboColorScheme.light();
final _flexColorCheme = FlexColorScheme.light(
  fontFamily: kFontFamily,
  primary: colorScheme.primary,
  onPrimary: colorScheme.onPrimary,
  primaryContainer: colorScheme.primaryContainer,
  onPrimaryContainer: colorScheme.onPrimaryContainer,
  secondary: colorScheme.secondary,
  onSecondary: colorScheme.onSecondary,
  error: colorScheme.primary,
  onError: colorScheme.onPrimary,
  background: colorScheme.background,
  scaffoldBackground: colorScheme.background,
  onBackground: colorScheme.onBackground,
  surface: colorScheme.surface,
  onSurface: colorScheme.onSurface,
  useMaterial3: true,
  useMaterial3ErrorColors: true,
  subThemesData: const FlexSubThemesData(
    elevatedButtonSchemeColor: SchemeColor.background,
    appBarBackgroundSchemeColor: SchemeColor.background,
  ),
);
