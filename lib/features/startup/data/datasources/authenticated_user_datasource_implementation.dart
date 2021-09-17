import 'dart:convert';

import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:wambo/features/startup/data/datasources/authenticated_user_datasource.dart';
import 'package:wambo/features/startup/data/models/authenticated_user_model.dart';

class AuthenticatedUserDatasourceImplementation
    implements IAuthenticatedUserDatasource {
  AuthenticatedUserDatasourceImplementation(this.storage);

  final ILocalStorage storage;

  @override
  Future<AuthenticatedUserModel> getAuthenticatedUserLocaly() async {
    final response = await storage.get("auth");

    if (response != null) {
      var data = json.decode(response);
      return AuthenticatedUserModel.fromJson(data);
    } else {
      throw FetchDataException('O que procuras não existe');
    }
  }
}
