import 'package:equatable/equatable.dart';

class AuthenticatedUserEntity extends Equatable {
  AuthenticatedUserEntity({
    required this.token,
    required this.refreshToken,
    required this.userId,
    this.avatar,
    required this.firstName,
    required this.email,
    required this.appToken,
    this.phone,
    required this.lastName,
  });

  final String token;
  final int userId;
  final String email;
  final String firstName;
  final String lastName;
  final String appToken;
  final String? phone;
  final String? avatar;
  final String refreshToken;

  @override
  List<Object?> get props =>
      [token, userId, firstName, phone, email, lastName, avatar, refreshToken, appToken];
}
