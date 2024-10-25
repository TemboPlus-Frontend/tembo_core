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
  TemboButtonStyle get _buttonStyle {
    return TemboButtonStyle.filled(
      backgroundColor: getColorScheme().surface,
      foregroundColor: getColorScheme().onSurface,
      width: 250,
      height: 60,
      borderRadius: kBorderRadius3,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TemboText(
              "Pick a language | Chagua lugha",
              style: context.textTheme.titleSmall.withOnPrimaryColor,
            ),
            const SizedBox(height: 20),
            LanguageButton.swahili(
              onTap: saveLocale,
              unselectedStyle: _buttonStyle,
              selectedStyle: _buttonStyle,
            ),
            const SizedBox(height: 10),
            LanguageButton.english(
              onTap: saveLocale,
              unselectedStyle: _buttonStyle,
              selectedStyle: _buttonStyle,
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
