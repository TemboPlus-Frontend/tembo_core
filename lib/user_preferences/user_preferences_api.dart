import 'package:hive/hive.dart';

class UserPreferencesAPI {
  static const _boxName = "preferences";
  static Future<void> init() async => await Hive.openBox(_boxName);

  late Box box;

  UserPreferencesAPI._() {
    box = Hive.box(_boxName);
  }

  static final instance = UserPreferencesAPI._();

  Future<void> put(key, value) async => await box.put(key, value);

  Future<void> delete(key) async => await box.delete(key);

  dynamic get(key) => box.get(key);
}
