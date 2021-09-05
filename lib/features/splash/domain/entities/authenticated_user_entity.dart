import 'package:equatable/equatable.dart';

class AuthenticatedUserEntity extends Equatable {
  AuthenticatedUserEntity(
      {required this.token,
      required this.userId,
      required this.refreshToken,
      required this.isFirstTime});

  final String token;
  final int userId;
  final bool isFirstTime;
  final String refreshToken;

  @override
  List<Object?> get props => [token, userId, isFirstTime, refreshToken];
}
