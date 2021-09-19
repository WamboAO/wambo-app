import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity {
  AuthenticatedUserModel(
      {required String token,
      required String refreshToken,
      required String username,
      required String avatar,
      int userId = 0,
      bool isFirstTime = true})
      : super(
            token: token,
            refreshToken: refreshToken,
            userId: userId,
            username: username,
            avatar: avatar,
            isFirstTime: isFirstTime);

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) =>
      AuthenticatedUserModel(
          token: json['token'],
          refreshToken: json['refresh_token'],
          userId: json['user_id'],
          username: json['username'],
          avatar: json['avatar'],
          isFirstTime: json['is_first_time']);

  Map<String, dynamic> toJson() => {
        'token': token,
        'refresh_token': refreshToken,
        'user_id': userId,
        'username': username,
        'avatar': avatar,
        'is_first_time': isFirstTime,
      };
}


