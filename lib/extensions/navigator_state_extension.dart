import 'package:flutter/material.dart';

extension NavigatorExtension on GlobalKey<NavigatorState> {
  Future push(String name, Widget page) async {
    return await currentState!.push(_createRouteFor(name, page));
  }

  dynamic pop([result]) {
    currentState!.pop(result);
  }

  void popToFirstPage() {
    currentState!.popUntil((route) => route.isFirst);
  }
}

extension NavigatorStateExtension on NavigatorState {
  Future<T?> pushPage<T>(String name, Widget page) async {
    return await push<T>(_createRouteFor(name, page));
  }

  Future<T?> to<T>(String name, Widget page) async => pushPage(name, page);
}

PageRouteBuilder<T> _createRouteFor<T>(String name, Widget page) {
  return _SlideRightRoute<T>(name: name, page: page);
}

class _SlideRightRoute<T> extends PageRouteBuilder<T> {
  _SlideRightRoute({required Widget page, required String name})
      : super(
          settings: RouteSettings(name: name),
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
