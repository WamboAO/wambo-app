import 'dart:convert';

import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:wambo/modules/startup/data/datasources/authenticated_user_datasource.dart';
import 'package:wambo/modules/startup/data/models/authenticated_user_model.dart';

class AuthenticatedUserDatasourceImplementation
    implements IAuthenticatedUserDatasource {
  AuthenticatedUserDatasourceImplementation(this.storage);

  final ILocalStorage storage;

  @override
  Future<AuthenticatedUserModel> getAuthenticatedUserLocaly() async {
    try {
      final response = await storage.get(
          key: "auth", debugType: 'get_authenticated_user_localy');

      if (response != null) {
        var data = json.decode(response);
        return AuthenticatedUserModel.fromJson(data);
      } else {
        throw FetchDataException('O que procuras não existe');
      }
    } catch (e) {
      throw FetchDataException('$e');
    }
  }
}
