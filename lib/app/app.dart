import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:tembo_core/tembo_core.dart';

enum Project {
  temboPlus("TemboPlus"),
  lipaChina("LipaChina"),
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

FlexColorScheme getColorScheme() {
  final project = getProject();
  switch (project) {
    case Project.lipaChina:
      return lipaChinaLightFlexColorScheme;
    default:
      return defaultLightFlexColorScheme;
  }
}

TemboColorScheme getTemboColorScheme() {
  final project = getProject();
  switch (project) {
    case Project.lipaChina:
      return lipaChinaLightColorScheme;
    default:
      return defaultLightColorScheme;
  }
}
