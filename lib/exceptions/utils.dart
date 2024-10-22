import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'exception.dart';

@Deprecated("Use handleError instead")
TemboException handleException(var e, [StackTrace? trace]) {
  debugPrint("$e");
  debugPrint(trace?.toString());

  switch (e.runtimeType) {
    case TemboException _:
      return e;
    case SocketException _:
      return TemboException.timeout();
    case TimeoutException _:
      return TemboException.timeout();
    default:
      return TemboException.unknown();
  }
}

TemboException handleError(e, [StackTrace? trace]) {
  debugPrint("$e");
  debugPrint(trace?.toString());
  switch (e) {
    case String str:
      return TemboException(Message(enMessage: str, swMessage: str));
    case Map map:
      if (map.containsKey("message")) {
        return TemboException(
          Message(
            enMessage: map["message"],
            swMessage: map["message"],
          ),
        );
      } else {
        return TemboException.unknown();
      }
    case Message msg:
      return TemboException(msg);
    case TemboException err:
      return err;
    case SocketException _:
    case TimeoutException _:
      return const TemboException(
        Message(
          enMessage: "Please check your internet connection",
          swMessage: "Tafadhali angalia internet yako",
        ),
      );
  }

  return TemboException.unknown();
}
