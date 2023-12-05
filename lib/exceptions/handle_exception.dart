import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';

import 'exception.dart';

TemboException handleException(var e, [StackTrace? trace]) {
  debugPrint(e);
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
