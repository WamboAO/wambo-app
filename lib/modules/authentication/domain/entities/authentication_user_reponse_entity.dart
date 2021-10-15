import 'package:equatable/equatable.dart';

class AuthenticationUserReponseEntity extends Equatable {
  AuthenticationUserReponseEntity({required this.token, required this.user});
  final TokenEntity token;
  final UserEntity user;

  @override
  List<Object?> get props => [token, user];
}

class TokenEntity extends Equatable {
  TokenEntity({required this.token, required this.refreshToken});

  final String token;
  final String refreshToken;
  @override
  List<Object?> get props => [token, refreshToken];
}

class UserEntity extends Equatable {
  UserEntity(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      this.avatar,
      this.phone});
  final int userId;
  final String firstName;
  final String lastName;
  final String? avatar;
  final String? phone;

  @override
  List<Object?> get props => [userId, firstName, lastName, avatar, phone];
}
