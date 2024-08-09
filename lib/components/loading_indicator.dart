import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tembo_core/tembo_core.dart';

class TemboLoadingIndicator extends StatelessWidget {
  final Color? color;
  const TemboLoadingIndicator({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    final c = color ?? context.colorScheme.primary;
    return isIOS
        ? CupertinoActivityIndicator(color: c, radius: 10)
        : CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation(c),
          );
  }
}
