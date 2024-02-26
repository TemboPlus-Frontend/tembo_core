import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../exceptions/exception.dart';

part 'model_state.freezed.dart';

@freezed
class ModelState<T> with _$ModelState<T> {
  const ModelState._();

  const factory ModelState.initial() = _Initial;

  const factory ModelState.loading() = _Loading;

  const factory ModelState.success(T data) = _Success;

  const factory ModelState.error(TemboException exc) = _Error;

  T? get data {
    return maybeWhen(
      success: (data) => data,
      orElse: () => null,
    );
  }

  bool get isLoading => maybeWhen(orElse: () => false, loading: () => true);

  TemboException? get exception =>
      maybeWhen(orElse: () => null, error: (e) => e);
}
