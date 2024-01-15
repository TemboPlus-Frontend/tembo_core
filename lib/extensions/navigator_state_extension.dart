import 'package:flutter/material.dart';
import 'package:tembo_core/extensions/stateful_widget_extension.dart';

extension NavigatorExtension on GlobalKey<NavigatorState> {
  Future<T?> to<T>(String routeName, Widget page) async {
    return await currentState?.push<T>(_createRouteFor(routeName, page));
  }

  Future<T?> push<T>(TemboPage page) async {
    return await currentState?.push<T>(_createRouteFor(page.name, page));
  }

  Future<T?> push2<T>(TemboStatefulPage page) async {
    return await currentState?.push<T>(_createRouteFor(page.name, page));
  }

  Future<T?> push3<T>(TemboConsumerPage page) async {
    return await currentState?.push<T>(_createRouteFor(page.name, page));
  }

  dynamic pop([result]) {
    currentState?.pop(result);
  }

  void popUntil(bool Function(Route r) predicate) {
    currentState?.popUntil(predicate);
  }

  void popToFirstPage() {
    currentState?.popUntil((route) => route.isFirst);
  }

  void removeAllAndPush(Widget page) {
    currentState?.pushAndRemoveUntil(
        _createRouteFor("", page), (route) => false);
  }
}

extension NavigatorStateExtension on NavigatorState {
  Future<T?> to<T>(TemboPage page) async {
    return await push<T>(_createRouteFor(page.name, page));
  }

  Future<T?> to2<T>(TemboStatefulPage page) async {
    return await push<T>(_createRouteFor(page.name, page));
  }

  Future<T?> to3<T>(TemboConsumerPage page) async {
    return await push<T>(_createRouteFor(page.name, page));
  }
}

PageRouteBuilder<T> _createRouteFor<T>(String name, Widget page) {
  return _SlideRightRoute<T>(page: page, name: name);
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
