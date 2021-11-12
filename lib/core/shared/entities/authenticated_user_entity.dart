import 'package:equatable/equatable.dart';

class AuthenticatedUserEntity extends Equatable {
  const AuthenticatedUserEntity({
    this.id,
    this.email,
    this.name,
    this.phone,
    this.dob,
    this.gender,
    this.avatar,
    this.address,
    this.role,
    this.createdAt,
    this.token,
    this.refreshToken,
    this.appId,
    this.appToken,
  });

  final int? id;
  final String? email;
  final String? name;
  final String? phone;
  final String? dob;
  final String? gender;
  final String? avatar;
  final String? address;
  final String? role;
  final String? createdAt;
  final String? token;
  final String? refreshToken;
  final String? appId;
  final String? appToken;

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        phone,
        dob,
        gender,
        avatar,
        address,
        role,
        createdAt,
        token,
        refreshToken,
        appId,
        appToken,
      ];
}
