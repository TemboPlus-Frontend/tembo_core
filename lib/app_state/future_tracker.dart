import '../../../source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../exceptions/exception.dart';
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
    void Function(T data)? onDone,
    void Function(AppException error)? onError,
  }) async {
    if (onLoading != null) onLoading();
    try {
      final result = await future.timeout(_timeOutLimit);
      if (onDone != null) onDone(result);
    } catch (e, trace) {
      final error = handleException(e, trace);
      if (onError == null) showErrorSnackbar(error.message);
      if (onError != null) onError(error);
    }
  }

  Future<void> trackAppState<T>({
    required Future<T> future,
    void Function(T data)? onDone,
    void Function(AppException error)? onError,
    String? loadingMessage,
    String? successMessage,
  }) async {
    ref.read(appStateProvider.notifier).startLoading(loadingMessage);

    try {
      final result = await future.timeout(_timeOutLimit);
      ref.read(appStateProvider.notifier).showSuccess(successMessage);
      if (onDone != null) onDone(result);
    } catch (e, trace) {
      final error = handleException(e, trace);
      ref.read(appStateProvider.notifier).showFailure(error);
      if (onError != null) onError(error);
    }
  }

  Future<void> trackWithNotifier<T>({
    required ModelStateNotifier<T> notifier,
    required Future<T> future,
    bool showErrorWithSnackbar = true,
    void Function(T)? onSuccess,
    void Function()? onLoading,
    void Function(AppException)? onError,
  }) async {
    notifier.showLoading();
    if (onLoading != null) onLoading();

    try {
      final result = await future.timeout(_timeOutLimit);
      notifier.showSuccess(result);
      if (onSuccess != null) onSuccess(result);
    } catch (e, trace) {
      final error = handleException(e, trace);
      notifier.showFailure(error);
      if (onError != null) onError(error);
      if (onError == null && showErrorWithSnackbar) {
        showErrorSnackbar(error.message);
      }
    }
  }
}
