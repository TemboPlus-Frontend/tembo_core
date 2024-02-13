import 'package:hive/hive.dart';
import 'package:tembo_core/api/base_local_api.dart';

class UserPreferencesAPI extends BaseLocalAPI {
  static const _boxName = "preferences";
  static Future<void> init() async => await Hive.openBox(_boxName);

  UserPreferencesAPI._() {
    final box = Hive.box(_boxName);
    super.initBox(box);
  }

  static final instance = UserPreferencesAPI._();
}
