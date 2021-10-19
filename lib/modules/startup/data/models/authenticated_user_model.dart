import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity {
  AuthenticatedUserModel(
      {required String token,
      required String refreshToken,
      required String firstName,
      required String lastName,
       String? phone,
      required String email,
       String? avatar,
       required String appToken,
      int userId = 0,
      })
      : super(
           email: email,
           appToken: appToken,
            token: token,
            refreshToken: refreshToken,
            userId: userId,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            avatar: avatar,
           );

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) =>
      AuthenticatedUserModel(
          token: json['token'],
          email: json['email'],
          appToken: json['app_token'],
          refreshToken: json['refresh_token'],
          userId: json['user_id'],
          firstName: json['first_name'],
          lastName: json['last_name'],
          phone: json['phone'],
          avatar: json['avatar'],
        );

  Map<String, dynamic> toJson() => {
        'token': token,
        'email': email,
        'app_token': appToken,
        'refresh_token': refreshToken,
        'user_id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'avatar': avatar,
        
      };
}


