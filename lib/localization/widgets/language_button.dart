import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tembo_core/extensions/source.dart';

import '../../api/user_prefs_apis/locale_api.dart';
import '../../components/source.dart';
import '../../constants/locale.dart';
import '../../styles/button_styles.dart';

class LanguageButton extends ConsumerWidget {
  final void Function(TemboLocale currentLocale) onTap;
  final TemboLocale _locale;
  final TemboButtonStyle? selectedStyle, unselectedStyle;

  const LanguageButton.swahili({
    super.key,
    required this.onTap,
    this.selectedStyle,
    this.unselectedStyle,
  }) : _locale = TemboLocale.sw;

  const LanguageButton.english({
    super.key,
    required this.onTap,
    this.selectedStyle,
    this.unselectedStyle,
  }) : _locale = TemboLocale.en;

  TemboButtonStyle _unselectedStyle(BuildContext context) {
    if (unselectedStyle != null) return unselectedStyle!;
    return TemboButtonStyle(
      backgroundColor: context.colorScheme.surface,
      foregroundColor: context.colorScheme.onSurface,
       width: 250,
      borderColor: context.colorScheme.outline,
    );
  }

  TemboButtonStyle  _selectedStyle(BuildContext context) {
    if (selectedStyle != null) return selectedStyle!;
    return _unselectedStyle(context).copyWith(
      borderWidth: 1.5,
      borderColor: context.colorScheme.primary,
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final currentLang = LocaleAPI.instance.getLocale();
    final selected = _locale == currentLang;
    final style = selected ? _selectedStyle(context) : _unselectedStyle(context);

    return TemboTextButton(
      onPressed: () => onTap(_locale),
      style: style,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Center(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      _locale.isSW
                          ? "assets/images/tz_flag.png"
                          : "assets/images/us_flag.png",
                      width: 50,
                      height: 30,
                    ),
                  ),
                  TemboText(
                    _locale.label,
                    style: style.getTextStyle?.withSize(16),
                  ),
                ],
              ),
            ),
          ),
          if (selected) const Icon(CupertinoIcons.check_mark_circled_solid)
        ],
      ),
    );
  }
}
