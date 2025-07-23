/// An abstract interface for a generic caching service.
/// This allows the caching implementation (e.g., Hive, SharedPreferences)
/// to be swapped out without changing the data source logic.
abstract class CacheService {
  /// Retrieves a value from the cache.
  ///
  /// [boxName] is the identifier for a collection of cached items (like a Hive box).
  /// [key] is the specific identifier for the cached item.
  Future<T?> get<T>(String boxName, String key);

  /// Puts a value into the cache.
  ///
  /// [boxName] is the identifier for the collection.
  /// [key] is the specific identifier for the item.
  /// [value] is the data to be cached.
  Future<void> put<T>(String boxName, String key, T value);

  /// Deletes a value from the cache.
  Future<void> delete(String boxName, String key);
}