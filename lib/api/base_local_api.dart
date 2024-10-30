import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tembo_core/api/tembo_prefs_api.dart';
import 'package:tembo_core/api/user_prefs_apis/user_prefs_api.dart';

Future<void> initHive() async {
  if (!kIsWeb) {
    final dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
  }

  await UserPreferencesAPI.init();
  await TemboPreferencesAPI.init();
}

abstract class BaseLocalAPI {
  Box? _box;

  Box get box {
    if (_box == null) throw "box is null";
    return _box!;
  }

  void initBox(Box box) {
    _box = box;
  }

  List getAll() => box.values.toList();

  List<MapEntry> getEntries() {
    final entries = <MapEntry>[];

    final values = box.values.toList();
    final keys = box.keys;
    for (int i = 0; i < values.length; i++) {
      entries.add(MapEntry(keys.elementAt(i), values.elementAt(i)));
    }

    return entries;
  }

  Future<void> put(key, value) async => await box.put(key, value);

  Future<void> delete(key) async => await box.delete(key);

  Future<void> clear() async => await deleteAll();

  Future<void> deleteAll() async => await box.clear();

  T? get<T>(key) => box.get(key) as T?;
}
