import 'package:flutter/material.dart';

import '../components/loading_indicator.dart';
import '../components/snack_bar.dart';

final rootNavKey = GlobalKey<NavigatorState>();

final rootMessengerKey = GlobalKey<ScaffoldMessengerState>();

Future<T?> push<T>(
  BuildContext context, {
  required Widget page,
  required String routeName,
}) async {
  final navigatorState = Navigator.of(context);
  return await navigatorState.push(MaterialPageRoute(
    builder: (_) => page,
    settings: RouteSettings(name: routeName),
  ));
}

void pop(context, [result]) {
  final navigatorState = Navigator.of(context);
  navigatorState.pop(result);
}

void popUntil(BuildContext context, {required String routeName}) {
  final navigatorState = Navigator.of(context);
  navigatorState.popUntil((route) => route.settings.name == routeName);
}

void pushAndRemoveUntil(BuildContext context, {required Widget page}) {
  final navigatorState = Navigator.of(context);
  navigatorState.pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page), (route) => false);
}

void showLoadingMaterialBanner([String? message]) {
  rootMessengerKey.currentState!.clearMaterialBanners();
  rootMessengerKey.currentState!.showMaterialBanner(
    MaterialBanner(
      content: Text(message ?? "Loading..."),
      actions: const [TemboLoadingIndicator(), SizedBox(width: 10)],
    ),
  );
}

void showSnackbar(
  String message, {
  bool isError = true,

  /// seconds
  int? duration,
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  BuildContext? context,
}) {
  ScaffoldMessengerState? state;
  if (scaffoldMessengerKey != null) state = scaffoldMessengerKey.currentState;
  if (state == null && context != null) state = ScaffoldMessenger.of(context);
  state ??= rootMessengerKey.currentState;

  if (state == null) return;

  state.showSnackBar(TemboSnackbar(
    state.context,
    message,
    isError: isError,
    durationInSeconds: duration,
  ));
}

void showInfoSnackbar(String message) => showSnackbar(
      message,
      isError: false,
    );
