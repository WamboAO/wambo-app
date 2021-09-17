abstract class ILocalStorage {
  Future get(String key);
  Future clear();
  Future delete(String key);
  Future put(String key, dynamic value);
}