import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tembo_core/extensions/textstyle_extension.dart';
import 'package:tembo_core/localization/locale_api.dart';

import '../../app/app.dart';
import '../../components/text.dart';
import '../../constants/constants.dart';
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

  TemboButtonStyle get _unselectedStyle {
    if (unselectedStyle != null) return unselectedStyle!;
    return TemboButtonStyle(
      backgroundColor: getTemboColorScheme().background,
      foregroundColor: getTemboColorScheme().onBackground,
      width: 250,
      height: 60,
      borderRadius: kBorderRadius3,
      borderColor: getTemboColorScheme().border,
      padding: const EdgeInsets.symmetric(horizontal: 30),
    );
  }

  TemboButtonStyle get _selectedStyle {
    if (selectedStyle != null) return selectedStyle!;
    return _unselectedStyle.copyWith(
      borderWidth: 1.5,
      borderColor: getTemboColorScheme().primary,
    );
  }

  @override
  Widget build(BuildContext context, ref) {
    final currentLang = LocaleAPI.instance.getLocale();
    final selected = _locale == currentLang;
    final style = selected ? _selectedStyle : _unselectedStyle;

    return TextButton(
      onPressed: () => onTap(_locale),
      style: style.buttonStyle,
      child: Row(
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
