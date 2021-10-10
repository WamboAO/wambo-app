import 'package:wambo/features/authentication/domain/entities/user_registration_crendentials_entities.dart';

class UserRegistrationCredentialsModel
    extends UserRegistrationCredentialsEntity {
  UserRegistrationCredentialsModel(
      {String? email,
      String? phone,
       String? firstName,
       String? lastName,
       String? password,
      String? avatar,
      required String registrationType})
      : super(
            email: email,
            phone: phone,
            password: password,
            firstName: firstName,
            lastName: lastName,
            avatar: avatar,
            registrationType: registrationType);

  factory UserRegistrationCredentialsModel.fromJson(
          Map<String, dynamic> json) =>
      UserRegistrationCredentialsModel(
        email: json['email'],
        phone: json['phone'],
        registrationType: json['registration_type'],
        password: json['password'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'password': password,
        'phone': phone,
        'avatar': avatar,
        'registration_type': registrationType
      };
}
