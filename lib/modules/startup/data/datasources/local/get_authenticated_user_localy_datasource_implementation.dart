import 'dart:convert';

import 'package:wambo/app/imports.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/modules/startup/data/datasources/local/get_authenticated_user_localy_datasource.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';
import 'package:wambo/core/shared/models/authenticated_user_model.dart';

class GetAuthenticatedUserLocalyDatasourceImplementation
    implements IGetAuthenticatedUserLocalyDatasource {
  GetAuthenticatedUserLocalyDatasourceImplementation(this.local);
  final ILocalStorage local;

  @override
  Future<bool> addUserLocaly(AuthenticatedUserEntity params) async {
    try {
      String encoded = encodeData(params);
      final result = await local.put(
          key: "auth", value: encoded, debugType: "add_auth_user");
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthenticatedUserModel> getUserLocaly() async {
    try {
      final response = await local.get(key: "auth", debugType: "get_auth_user");
      if (response != null) {
        var data = json.decode(response);
        return AuthenticatedUserModel.fromJson(data);
      } else {
        throw FetchDataException('O que procuras não existe');
      }
    } catch (e) {
      rethrow;
    }
  }

  String encodeData(AuthenticatedUserEntity user) {
    AuthenticatedUserModel _auth = AuthenticatedUserModel(
        id: user.id,
        name: user.name,
        phone: user.phone,
        dob: user.dob,
        avatar: user.avatar,
        role: user.role,
        createdAt: user.createdAt,
        token: user.token,
        refreshToken: user.refreshToken,
        address: user.address,
        email: user.email,
        gender: user.gender);

    return jsonEncode(_auth);
  }

  @override
  Future<bool> removeUser() async {
    try {
      final result =
          await local.delete(key: "auth", debugType: "remove_auth_user");
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
