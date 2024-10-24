import 'package:flutter/material.dart';
import 'package:tembo_core/components/form/focus_wrapper.dart';

class TemboScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;
  final Color? backgroundColor;
  final bool extendBodyBehindAppBar;
  final bool extendBody;

  const TemboScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
    this.backgroundColor,
    this.extendBodyBehindAppBar = false,
    this.extendBody = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: FocusWrapper(
          child: Scaffold(
            body: body,
            appBar: appBar,
            extendBodyBehindAppBar: extendBodyBehindAppBar,
            extendBody: extendBody,
            backgroundColor: backgroundColor,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
            bottomNavigationBar: bottomNavigationBar,
          ),
        ),
      ),
    );
  }
}
