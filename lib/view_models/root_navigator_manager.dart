import 'package:flutter/material.dart';

import 'manager.dart';

final rootNavKey = GlobalKey<NavigatorState>();

class RootNavigatorManager extends Manager<NavigatorState> {
  RootNavigatorManager(super.data);
}
