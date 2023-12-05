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

  void showFailure(TemboException error) {
    state = ModelState.error(error);
  }
}

Widget buildInitial() => Container();
