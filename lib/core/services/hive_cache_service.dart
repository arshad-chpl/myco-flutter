
import 'package:hive/hive.dart';
import 'package:myco_flutter/core/services/cache_service.dart';

/// A caching service implementation that uses Hive for local storage.
class HiveCacheService implements CacheService {
  /// Opens a Hive box. If the box is already open, it returns the existing instance.
  Future<Box> _openBox(String boxName) async => await Hive.openBox(boxName);

  @override
  Future<T?> get<T>(String boxName, String key) async {
    final box = await _openBox(boxName);
    return box.get(key) as T?;
  }

  @override
  Future<void> put<T>(String boxName, String key, T value) async {
    final box = await _openBox(boxName);
    await box.put(key, value);
  }

  @override
  Future<void> delete(String boxName, String key) async {
    final box = await _openBox(boxName);
    await box.delete(key);
  }
}