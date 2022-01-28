import 'dart:convert';
import 'package:local/local.dart';
import 'package:wambo/app/imports.dart';
import 'package:errors/errors.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/authentication/data/models/authenticated_user_model.dart';
import 'package:wambo/modules/startup/data/datasources/local/authenticated_user_localy_data.dart';

class GetAuthenticatedUserLocalyDatasourceImplementation
    implements IGetAuthenticatedUserLocalyDatasource {
  GetAuthenticatedUserLocalyDatasourceImplementation(this.local);
  final ILocalStorage local;
  final _data = AuthenticatedUserLocalyData();

  @override
  Future<bool> addUserLocaly(AuthenticatedUserEntity params) async {
    try {
      String encoded = encodeData(params);
      final result =
          await local.put(key: "auth", value: encoded, debugData: true);
      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthenticatedUserModel> getUserLocaly() async {
    try {
      final response =
          await local.get(key: "auth", debugData: _data.fakeAuthValues);
      if (response != null) {
        
        var data = json.decode(response);
        return AuthenticatedUserModel.fromJson(data);
      } else {
        throw const FetchDataException('O que procuras não existe');
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
      final result = await local.delete(key: "auth", debugData: true);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
