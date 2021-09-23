import 'dart:convert';

import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:wambo/features/login/data/datasources/authenticate_user_datasource.dart';
import 'package:wambo/features/startup/data/models/authenticated_user_model.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticateUserDatasourceImplementation
    implements IAuthenticateUserDatasource {
  AuthenticateUserDatasourceImplementation(this.storage);
  final ILocalStorage storage;

  @override
  Future<bool> addAuthenticatedUserLocaly(
      AuthenticatedUserEntity userAuth) async {
    try {
      String encoded = encodeData(userAuth);
      final response = await storage.put("auth", encoded);
      return response;
    } catch (e) {
      throw FetchDataException('Erro ao inserir dados');
    }
  }

  String encodeData(AuthenticatedUserEntity userAuth) {
    AuthenticatedUserModel _auth = AuthenticatedUserModel(
        token: userAuth.token,
        refreshToken: userAuth.refreshToken,
        username: userAuth.username,
        avatar: userAuth.avatar,
        userId: userAuth.userId,
        isFirstTime: userAuth.isFirstTime);

    return jsonEncode(_auth);
  }
}
