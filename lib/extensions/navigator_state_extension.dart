import 'package:flutter/material.dart';
import 'package:tembo_ui/extensions/stateful_widget_extension.dart';

extension NavigatorExtension on GlobalKey<NavigatorState> {
  Future push(TemboPage page) async {
    return await currentState!.push(_createRouteFor(page));
  }

  dynamic pop([result]) {
    currentState!.pop(result);
  }

  void popToFirstPage() {
    currentState!.popUntil((route) => route.isFirst);
  }
}

extension NavigatorStateExtension on NavigatorState {
  Future<T?> to<T>(TemboPage page) async {
    return await push<T>(_createRouteFor(page));
  }
}

PageRouteBuilder<T> _createRouteFor<T>(TemboPage page) {
  return _SlideRightRoute<T>(page: page);
}

class _SlideRightRoute<T> extends PageRouteBuilder<T> {
  _SlideRightRoute({required TemboPage page})
      : super(
          settings: RouteSettings(name: page.name),
          pageBuilder: (_, __, ___) {
            return page;
          },
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(10.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        );
}
