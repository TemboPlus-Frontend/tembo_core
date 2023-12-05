import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../exceptions/exception.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const AppState._();

  const factory AppState.initial() = _Initial;

  const factory AppState.loading(String? message) = _Loading;

  const factory AppState.success(String? message) = _Success;

  const factory AppState.error(TemboException exc) = _Error;
}
