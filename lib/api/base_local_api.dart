import 'package:hive/hive.dart';

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

  Future<void> put(key, value) async => await box.put(key, value);

  Future<void> delete(key) async => await box.delete(key);

  Future<void> deleteAll() async {
    await box.deleteAll(box.keys);
  }

  T? get<T>(key) => box.get(key) as T?;
}
