import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity {
  const AuthenticatedUserModel({
    int? id,
    String? email,
    String? name,
    String? phone,
    String? dob,
    String? gender,
    String? avatar,
    String? address,
    String? role,
    String? createdAt,
    String? token,
    String? refreshToken,
    String? appId,
    String? appToken,
  }) : super(
            id: id,
            email: email,
            name: name,
            phone: phone,
            dob: dob,
            gender: gender,
            address: address,
            avatar: avatar,
            role: role,
            createdAt: createdAt,
            token: token,
            refreshToken: refreshToken,
            appId: appId,
            appToken: appToken);
  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) =>
      AuthenticatedUserModel(
          id: json['id'],
          email: json['email'],
          name: json['name'],
          phone: json['phone'],
          dob: json['birthday'],
          gender: json['gender'],
          address: json['address'],
          avatar: json['avatar'],
          role: json['role'],
          createdAt: json['created_at'],
          token: json['token'],
          refreshToken: json['refresh_token'],
          appId: json['app_id'],
          appToken: json['app_token']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'phone': phone,
        'birthday': dob,
        'gender': gender,
        'address': address,
        'avatar': avatar,
        'role': role,
        'created_at': createdAt,
        'token': token,
        'refresh_token': refreshToken,
        'app_id': appId,
        'app_token': appToken
      };
}
