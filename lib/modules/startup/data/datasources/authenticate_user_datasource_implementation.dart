import 'dart:convert';

import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:wambo/modules/startup/data/datasources/authenticate_user_datasource.dart';
import 'package:wambo/modules/startup/data/models/authenticated_user_model.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticateUserDatasourceImplementation
    implements IAuthenticateUserDatasource {
  AuthenticateUserDatasourceImplementation(this.storage);
  final ILocalStorage storage;

  @override
  Future<bool> addAuthenticatedUserLocaly(
      AuthenticatedUserEntity userAuth) async {
    try {
      String encoded = encodeData(userAuth);
      final response = await storage.put(key:"auth", value: encoded, debugType: "add_authenticated_user_localy");
      return response;
    } catch (e) {
      throw FetchDataException('Erro ao inserir dados');
    }
  }

  String encodeData(AuthenticatedUserEntity userAuth) {
    AuthenticatedUserModel _auth = AuthenticatedUserModel(
      email: userAuth.email,
        token: userAuth.token,
        refreshToken: userAuth.refreshToken,
        firstName: userAuth.firstName,
        lastName: userAuth.lastName,
        phone: userAuth.phone,
        avatar: userAuth.avatar,
        userId: userAuth.userId,
       );

    return jsonEncode(_auth);
  }
}
