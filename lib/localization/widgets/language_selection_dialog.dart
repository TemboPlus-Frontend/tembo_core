import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tembo_core/extensions/context_extension.dart';

import '../../components/text.dart';
import '../../constants/constants.dart';
import '../../constants/locale.dart';
import '../../utils/navigation_utils.dart';
import '../localization_manager.dart';
import 'language_button.dart';

void showLanguagePickDialog(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRadius3),
          ),
          child: const LanguageSelectionDialog(),
        );
      });
}

class LanguageSelectionDialog extends ConsumerStatefulWidget {
  const LanguageSelectionDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState
    extends ConsumerState<LanguageSelectionDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: kdx),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TemboText(
            "Pick language | Chagua Lugha",
            style: context.textTheme.titleSmall,
          ),
          const SizedBox(height: 20),
          LanguageButton.swahili(onTap: saveLocale),
          const SizedBox(height: 10),
          LanguageButton.english(onTap: saveLocale)
        ],
      ),
    );
  }

  saveLocale(TemboLocale locale) async {
    await ref.read(localeManagerProvider.notifier).update(locale);
    if (mounted) pop(context);
  }
}
