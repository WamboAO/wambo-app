import 'package:equatable/equatable.dart';

class AuthenticatedUserEntity extends Equatable {
  AuthenticatedUserEntity(
      {required this.token, required this.userId, required this.refreshToken});
  
  final String token;
  final int userId;
  final String refreshToken;

  @override
  
  List<Object?> get props => [token, userId, refreshToken];
}
