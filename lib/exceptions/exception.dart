import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'api_exception.dart';

const _defaultMessage = "An error happened";
const _defaultCode = "unknown";

class AppException {
  final String code;
  final String message;
  const AppException(this.code, this.message);

  const AppException.unknown()
      : message = _defaultMessage,
        code = "unknown";

  factory AppException.from(
    var e,
    StackTrace? trace, [
    String code = _defaultCode,
  ]) {
    debugPrint(e.runtimeType.toString());
    debugPrint(e.toString());
    debugPrint(trace.toString());
    var message = _defaultMessage;
    var code = _defaultCode;

    void updateMessage(String c, String m) {
      code = c;
      message = m;
    }

    switch (e.runtimeType) {
      case AppException:
        final err = e as AppException;
        updateMessage(err.code, err.message);
      case APIException:
        final err = e as APIException;
        updateMessage(err.code, err.message);
      case String:
        updateMessage(code, e);
        break;
      case SocketException:
        updateMessage(
          "socket_exception",
          "Tafadhali angalia internet yako",
        );
        break;
      case TimeoutException:
        updateMessage(
          "timeout_exception",
          "Jaribu Tena. Kuna tatizo lilitokea",
        );
        break;
      case ArgumentError:
        final exception = e as ArgumentError;
        updateMessage("unknown", exception.message);
        break;
      default:
        return AppException(code, message);
    }

    return AppException(code, message);
  }

  bool get isDefaultMessage => message == _defaultMessage;

  @override
  String toString() => "Code: $code, Message: $message";
}

AppException handleError(e, StackTrace trace) {
  return AppException.from(e, trace);
}
