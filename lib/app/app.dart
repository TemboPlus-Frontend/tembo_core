import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/constants/themes/clouds.dart';
import 'package:tembo_core/constants/themes/tembo_cars.dart';
import 'package:tembo_core/tembo_core.dart';

enum Project {
  temboPlus("TemboPlus"),
  clouds("CloudsTembo"),
  lipaChina("LipaChina"),
  temboCars("TemboCars"),
  ;

  final String label;
  const Project(this.label);
}

Future<void> registerApp(Project project) async {
  await UserPreferencesAPI.instance.put("app", project.name);
}

Project getProject() {
  return Project.values.firstWhere(
    (e) => e.name == UserPreferencesAPI.instance.get("app"),
    orElse: () => Project.temboPlus,
  );
}

ThemeData getTheme() {
  return getColorScheme().toTheme;
}

FlexColorScheme getColorScheme() {
  final project = getProject();
  switch (project) {
    case Project.lipaChina:
      return defaultLightFlexColorScheme;
    case Project.clouds:
      return cloudsTemboLightFlexColorScheme;
    case Project.temboCars:
      return temboCarsLightFlexColorScheme;
    default:
      return defaultLightFlexColorScheme;
  }
}

TemboColorScheme getTemboColorScheme() {
  final project = getProject();
  switch (project) {
    case Project.lipaChina:
      return defaultLightColorScheme;
    case Project.clouds:
      return cloudsTemboAppLightScheme;
    case Project.temboCars:
      return temboCarsLightColorScheme;
    default:
      return defaultLightColorScheme;
  }
}
