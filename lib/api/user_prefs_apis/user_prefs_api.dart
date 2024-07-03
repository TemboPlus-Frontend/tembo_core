import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../base_local_api.dart';

import 'locale_api.dart';
import 'token_api.dart';
import '../profile/local_api.dart';

/// Should be initiated with [UserPreferencesAPI.init] on the main function.
///
/// All data that should be deleted when the user signs out should be stored in
/// the 'preferences' box. With just [UserPreferencesAPI.clear] all data will be deleted
/// instead of trying to remember all boxes whose data should be deleted and
/// doing it manually
///
/// Look at [LocaleAPI], [ProfileAPI] and [TokenAPI] for implementation details.
class UserPreferencesAPI extends BaseLocalAPI {
  static const _boxName = "preferences";
  static Future<void> init() async => await Hive.openBox(_boxName);

  UserPreferencesAPI._() {
    final box = Hive.box(_boxName);
    super.initBox(box);
  }

  static final instance = UserPreferencesAPI._();

  @override

  /// Clears [LocaleAPI], [TokenAPI], [ProfileAPI] along with other apis
  /// using [UserPreferencesAPI.instance] to store data
  Future<void> clear() async {
    return super.clear().catchError((e) => debugPrint(e));
  }
}
