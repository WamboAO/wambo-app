import 'package:equatable/equatable.dart';

class UserRegistrationCredentialsEntity extends Equatable {
  UserRegistrationCredentialsEntity(
      {this.email,
      this.phone,
      this.firstName,
      this.lastName,
      this.password,
      this.avatar,
      required this.registrationType});
  final String? email;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final String? password;
  final String? avatar;
  final String registrationType;

  @override
  List<Object?> get props =>
      [email, phone, firstName, lastName, password, avatar, registrationType];
}
