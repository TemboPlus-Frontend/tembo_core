import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../exceptions/exception.dart';

part 'model_state_2.freezed.dart';

@freezed
class ModelState2<T> with _$ModelState2<T> {
  const ModelState2._();

  const factory ModelState2.initial(T data) = _Initial;

  const factory ModelState2.loading(T data) = _Loading;

  const factory ModelState2.success(T data) = _Success;

  const factory ModelState2.error(T data, TemboException exc) = _Error;

  bool get isLoading => maybeWhen(orElse: () => false, loading: (_) => true);

  TemboException? get exception =>
      maybeWhen(orElse: () => null, error: (_, e) => e);
}
