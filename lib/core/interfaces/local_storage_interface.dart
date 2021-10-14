abstract class ILocalStorage {
  Future get({required String key, String? debugType});
  Future<bool> clear({String? debugType});
  Future<bool> delete({required String key, String? debugType});
  Future<bool> put({required String key, required dynamic value, String? debugType});
}
