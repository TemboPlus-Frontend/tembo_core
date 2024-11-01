import 'package:flutter/material.dart';

class TemboColorScheme extends ThemeExtension<TemboColorScheme> {
  final Color success, onSuccess, successContainer, onSuccessContainer;

  TemboColorScheme({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
  });

  @override
  TemboColorScheme copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
  }) {
    return TemboColorScheme(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
    );
  }

  @override
  TemboColorScheme lerp(ThemeExtension<TemboColorScheme> other, double t) {
    if (other is! TemboColorScheme) {
      return this;
    }
    return TemboColorScheme(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer:
          Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
    );
  }
}
