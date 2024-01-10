import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/locale.dart';
import '../locales/language_settings_manager.dart';

class LocaleWrapper extends StatelessWidget {
  const LocaleWrapper({
    super.key,
    required this.child,
  });

  final Widget Function(BuildContext c, TemboLocale l) child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final l = ref.watch(localesManagerProvider);
        return child(context, l);
      },
    );
  }
}
