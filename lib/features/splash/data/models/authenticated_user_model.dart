import 'package:wambo/features/splash/domain/entities/authenticated_user_entity.dart';

class AuthenticatedUserModel extends AuthenticatedUserEntity {
  AuthenticatedUserModel(
      {required String token,
      required String refreshToken,
      required int userId,
      required bool isFirstTime})
      : super(
            token: token,
            refreshToken: refreshToken,
            userId: userId,
            isFirstTime: isFirstTime);

  factory AuthenticatedUserModel.fromJson(Map<String, dynamic> json) =>
      AuthenticatedUserModel(
          token: json['token'],
          refreshToken: json['refresh_token'],
          userId: json['user_id'],
          isFirstTime: json['is_first_time']);

  Map<String, dynamic> toJson() => {
        'token': token,
        'refresh_token': refreshToken,
        'user_id': userId,
        'is_first_time': isFirstTime,
      };
}


