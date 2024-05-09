import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'exception.dart';

@Deprecated("Use handleError instead")
TemboException handleException(var e, [StackTrace? trace]) {
  debugPrint("$e");
  debugPrint(trace?.toString());

  switch (e.runtimeType) {
    case TemboException:
      return e;
    case SocketException:
      return TemboException.timeout();
    case TimeoutException:
      return TemboException.timeout();
    default:
      return TemboException.unknown();
  }
}

TemboException handleError(e, [StackTrace? trace]) {
  switch (e) {
    case Message msg:
      return TemboException(msg);
    case TemboException err:
      return err;
    case SocketException:
    case TimeoutException:
      return const TemboException(
        Message(
          enMessage: "Please check your internet connection",
          swMessage: "Tafadhali angalia internet yako",
        ),
      );
  }

  return TemboException.unknown();
}
