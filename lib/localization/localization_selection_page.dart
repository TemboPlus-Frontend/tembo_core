import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tembo_core/tembo_core.dart';

import 'widgets/language_button.dart';

class LanguageSelectionPage extends ConsumerStatefulWidget {
  final ValueChanged<TemboLocale> afterSelected;
  const LanguageSelectionPage({required this.afterSelected, super.key});

  @override
  ConsumerState<LanguageSelectionPage> createState() =>
      _LanguageSelectionState();
}

class _LanguageSelectionState extends ConsumerState<LanguageSelectionPage> {
  TemboButtonStyle _buttonStyle(BuildContext context) {
    return TemboButtonStyle.filled(
      backgroundColor: context.colorScheme.secondaryContainer,
      foregroundColor: context.colorScheme.onSecondaryContainer,
      width: 250,
    );
  }

  @override
  Widget build(BuildContext context) {
    final buttonStyle = _buttonStyle(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TemboText(
              "Pick a language | Chagua lugha",
              style: context.textTheme.titleSmall,
            ),
            const SizedBox(height: 20),
            LanguageButton.swahili(
              onTap: saveLocale,
              unselectedStyle: buttonStyle,
              selectedStyle: buttonStyle,
            ),
            const SizedBox(height: 10),
            LanguageButton.english(
              onTap: saveLocale,
              unselectedStyle: buttonStyle,
              selectedStyle: buttonStyle,
            ),
          ],
        ),
      ),
    );
  }

  saveLocale(TemboLocale locale) async {
    await ref.read(localeManagerProvider.notifier).update(locale);
    widget.afterSelected(locale);
  }
}
