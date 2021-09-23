abstract class ILocalStorage {
  Future get(String key);
  Future<bool> clear();
  Future<bool> delete(String key);
  Future<bool> put(String key, dynamic value);
}