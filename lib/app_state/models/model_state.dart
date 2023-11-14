import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../exceptions/exception.dart';

part 'model_state.freezed.dart';

@freezed
class ModelState<T> with _$ModelState<T> {
  const ModelState._();

  const factory ModelState.initial() = _Initial;

  const factory ModelState.loading() = _Loading;

  const factory ModelState.success(T data) = _Success;

  const factory ModelState.error(AppException error) = _Error;

  T? get data {
    return maybeWhen(
      success: (data) => data,
      orElse: () => null,
    );
  }

  bool get isLoading => maybeWhen(orElse: () => false, loading: () => true);
}

@freezed
class ModelActionState<S, T> with _$ModelActionState<S, T> {
  const ModelActionState._();

  const factory ModelActionState.initial() = __Initial;

  const factory ModelActionState.loading(S action) = __Loading;

  const factory ModelActionState.success(T data) = __Success;

  const factory ModelActionState.error(AppException error) = __Error;
}
