import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity {
  AuthenticatedUserModel(
      {required String token,
      required String refreshToken,
      required String firstName,
      required String lastName,
      required String phone,
      required String avatar,
      int userId = 0,
      bool isFirstTime = true})
      : super(
            token: token,
            refreshToken: refreshToken,
            userId: userId,
            firstName: firstName,
            lastName: lastName,
            phone: phone,
            avatar: avatar,
            isFirstTime: isFirstTime);

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) =>
      AuthenticatedUserModel(
          token: json['token'],
          refreshToken: json['refresh_token'],
          userId: json['user_id'],
          firstName: json['first_name'],
          lastName: json['last_name'],
          phone: json['phone'],
          avatar: json['avatar'],
          isFirstTime: json['is_first_time']);

  Map<String, dynamic> toJson() => {
        'token': token,
        'refresh_token': refreshToken,
        'user_id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'avatar': avatar,
        'is_first_time': isFirstTime,
      };
}


