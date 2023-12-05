import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../exceptions/exception.dart';
import 'models/app_state.dart';

final appStateProvider = StateNotifierProvider<_AppStateNotifier, AppState>(
    (_) => _AppStateNotifier());

class _AppStateNotifier extends StateNotifier<AppState> {
  _AppStateNotifier() : super(const AppState.initial());

  void startLoading([String? message]) {
    state = AppState.loading(message);
  }

  void showSuccess([String? message]) {
    state = AppState.success(message);
  }

  void showFailure([TemboException? exc]) {
    state = AppState.error(exc ?? TemboException.unknown());
  }
}
