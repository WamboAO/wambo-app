import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:wambo/modules/startup/data/datasources/authenticated_user_delete_datasource.dart';

class AuthenticatedUserDeleteDatasourceImplementation
    implements IAuthenticatedUserDeleteDatasource {
  AuthenticatedUserDeleteDatasourceImplementation(this.storage);
  final ILocalStorage storage;
  @override
  Future<bool> delete() {
    try {
      final response = storage.delete(key: "auth");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
