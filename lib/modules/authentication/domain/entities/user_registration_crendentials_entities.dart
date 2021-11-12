import 'package:equatable/equatable.dart';
import 'package:wambo/core/utils/enums.dart';

class UserRegistrationCredentialsEntity extends Equatable {
  UserRegistrationCredentialsEntity(
      {this.password,
      this.email,
      this.name,
      this.phone,
      this.dob,
      this.gender,
      this.avatar,
      this.address,
      required this.appId,
      required this.appToken,
      this.social,
      required this.registrationType,
      required this.type});
  final String? password;
  final String? email;
  final String? name;
  final String? phone;
  final String? dob;
  final String? gender;
  final String? avatar;
  final String? address;
  final String appId;
  final String appToken;
  final String registrationType;
  final AccessType type;
  final Social? social;

  @override
  List<Object?> get props => [
        password,
        email,
        name,
        phone,
        dob,
        gender,
        avatar,
        address,
        appId,
        appToken,
        registrationType,
        type,
        social,
      ];
}
