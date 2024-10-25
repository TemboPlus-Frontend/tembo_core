import 'package:flutter/material.dart';

import '../../app/app.dart';

class FocusWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  const FocusWrapper({super.key, required this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: getColorScheme().surface,
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            if (onTap != null) onTap!();
          },
          child: child,
        ),
      ),
    );
  }
}
