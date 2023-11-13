import 'package:flutter/material.dart';
import 'package:tembo_ui/extensions/source.dart';

import '../widgets/theme_data_wrapper.dart';
import 'text.dart';
import 'text_button.dart';

class TemboBottomButton extends StatelessWidget {
  final VoidCallback callback;
  final String? text;
  const TemboBottomButton({
    super.key,
    required this.callback,
    this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ThemeDataWrapper(builder: (context, theme) {
        return TemboTextButton(
          onPressed: callback,
          style: theme.bottomNavBarButtonStyle,
          child: TemboText(text ?? context.l.next),
        );
      }),
    );
  }
}
