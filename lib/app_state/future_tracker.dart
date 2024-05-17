import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants/locale.dart';
import '../exceptions/source.dart';
import '../utils/navigation_utils.dart';
import 'app_state_notifier.dart';
import 'model_state_notifier.dart';

const _timeOutLimit = Duration(seconds: 300);

final futureTrackerProvider = Provider((ref) => _FutureTracker(ref));

class _FutureTracker {
  final ProviderRef ref;
  _FutureTracker(this.ref);

  Future<void> track<T>({
    required Future<T> future,
    void Function()? onLoading,
    void Function(T data)? onSuccess,
    void Function(TemboException exc)? onError,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  }) async {
    if (onLoading != null) onLoading();
    try {
      final result = await future.timeout(_timeOutLimit);
      if (onSuccess != null) onSuccess(result);
    } catch (e, trace) {
      final error = handleError(e, trace);
      if (onError == null) {
        _showErrorSnackbar(
          error,
          scaffoldMessengerKey: scaffoldMessengerKey,
        );
      }
      if (onError != null) onError(error);
    }
  }

  Future<void> trackAppState<T>({
    required Future<T> future,
    void Function(T data)? onSuccess,
    void Function(TemboException exc)? onError,
    bool showErrorWithSnackbar = true,
    String? loadingMessage,
    String? successMessage,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  }) async {
    ref.read(appStateProvider.notifier).startLoading(loadingMessage);

    try {
      final result = await future.timeout(_timeOutLimit);
      ref.read(appStateProvider.notifier).showSuccess(successMessage);
      if (onSuccess != null) onSuccess(result);
    } catch (e, trace) {
      final error = handleError(e, trace);
      ref.read(appStateProvider.notifier).showFailure(error);
      if (showErrorWithSnackbar) {
        _showErrorSnackbar(
          error,
          scaffoldMessengerKey: scaffoldMessengerKey,
        );
      }
      if (onError != null) onError(error);
    }
  }

  Future<void> trackWithNotifier<T>({
    required ModelStateNotifier<T> notifier,
    required Future<T> future,
    bool showErrorWithSnackbar = true,
    void Function(T data)? onSuccess,
    void Function()? onLoading,
    void Function(TemboException exc)? onError,
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
  }) async {
    notifier.showLoading();
    if (onLoading != null) onLoading();

    try {
      final result = await future.timeout(_timeOutLimit);
      notifier.showSuccess(result);
      if (onSuccess != null) onSuccess(result);
    } catch (e, trace) {
      final error = handleError(e, trace);
      notifier.showFailure(error);
      if (onError != null) onError(error);
      if (onError == null && showErrorWithSnackbar) {
        _showErrorSnackbar(
          error,
          scaffoldMessengerKey: scaffoldMessengerKey,
        );
      }
    }
  }
}

void _showErrorSnackbar(
  TemboException exc, {
  int? duration,
  GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
}) {
  return showSnackbar(
    exc.message.fromLocale(getCurrentLocale()),
    scaffoldMessengerKey: scaffoldMessengerKey,
    duration: duration,
  );
}
