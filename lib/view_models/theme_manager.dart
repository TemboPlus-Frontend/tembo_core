import 'manager.dart';

import '../constants/themes/theme_data.dart';

class ThemeManager extends Manager<TemboThemeData> {
  ThemeManager(super.data);

  void updateTheme(TemboThemeData data) => update(data);
}
