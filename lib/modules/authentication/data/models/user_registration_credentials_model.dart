import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/domain/entities/user_registration_crendentials_entities.dart';

class UserRegistrationCredentialsModel
    extends UserRegistrationCredentialsEntity {
  UserRegistrationCredentialsModel({
    String? password,
    String? email,
    String? name,
    String? phone,
    String? dob,
    String? gender,
    String? avatar,
    String? address,
    required String appId,
    required String appToken,
    required String registrationType,
    required AccessType type,
    Social? social,
  }) : super(
          password: password,
          email: email,
          name: name,
          phone: phone,
          dob: dob,
          gender: gender,
          avatar: avatar,
          address: address,
          appId: appId,
          appToken: appToken,
          registrationType: registrationType,
          type: type,
          social: social
        );

     factory UserRegistrationCredentialsModel.fromJson(
          Map<String, dynamic> json) =>
      UserRegistrationCredentialsModel(
        password: json['password'],
          email: json['email'],
          name: json['name'],
          phone: json['phone'],
          dob: json['birthday'],
          gender: json['gender'],
          avatar: json['avatar'],
          address: json['address'],
          appId: json['app_id'],
          appToken: json['app_token'],
          registrationType: json['registration_type'],
          type: json['type'],
          social: json['social']
           
       
      );


  Map<String, dynamic> toJson() => {
        "password": password,
        "email": email,
        "name": name,
        "phone": phone,
        "birthday": dob,
        "gender": gender,
        "avatar": avatar,
        "address": address,
        "app_id": appId,
        "registrationType": registrationType
      };
}
