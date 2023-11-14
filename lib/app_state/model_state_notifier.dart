import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../exceptions/exception.dart';
import 'models/model_state.dart';

StateNotifierProvider<ModelStateNotifier<T>, ModelState<T>>
    createModelStateNotifier<T>() {
  final provider =
      StateNotifierProvider<ModelStateNotifier<T>, ModelState<T>>((ref) {
    return ModelStateNotifier();
  });

  return provider;
}

class ModelStateNotifier<T> extends StateNotifier<ModelState<T>> {
  ModelStateNotifier() : super(const ModelState.initial());

  void showLoading() {
    state = const ModelState.loading();
  }

  void showSuccess(T data) {
    state = ModelState.success(data);
  }

  void showFailure(AppException error) {
    state = ModelState.error(error);
  }
}

StateNotifierProvider<ModelActionStateNotifier<S, T>, ModelActionState<S, T>>
    createModelActionStateNotifier<S, T>() {
  final provider = StateNotifierProvider<ModelActionStateNotifier<S, T>,
      ModelActionState<S, T>>((ref) {
    return ModelActionStateNotifier();
  });

  return provider;
}

class ModelActionStateNotifier<S, T>
    extends StateNotifier<ModelActionState<S, T>> {
  ModelActionStateNotifier() : super(const ModelActionState.initial());

  void showLoading(S message) {
    state = ModelActionState.loading(message);
  }

  void showSuccess(T data) {
    state = ModelActionState.success(data);
  }

  void showFailure(AppException error) {
    state = ModelActionState.error(error);
  }
}

Widget buildInitial() => Container();
