import 'manager.dart';

import '../constants/locale.dart';

class LocaleManager extends Manager<TemboLocale> {
  LocaleManager(super.data);

  void updateLocale(TemboLocale locale) => update(locale);
}
