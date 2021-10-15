import 'package:wambo/modules/authentication/domain/entities/authentication_user_reponse_entity.dart';



class AuthenticationUserResponseModel extends AuthenticationUserReponseEntity {
  AuthenticationUserResponseModel({required TokenEntity token, required UserEntity user}) : super(token: token, user: user);
  factory AuthenticationUserResponseModel.fromJson(
          Map<String, dynamic> json) =>
      AuthenticationUserResponseModel(
        token: TokenModel.fromJson(json['token']),
        user: UserModel.fromJson(json['user'])
           
       
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'user': user
     
      };
}
class TokenModel extends TokenEntity {
  TokenModel({required String token, required String refreshToken}) : super(token: token, refreshToken: refreshToken);
  factory TokenModel.fromJson(
          Map<String, dynamic> json) =>
      TokenModel(
        token: json['token'],
        refreshToken: json['refresh_token'],    
       
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'refresh_token': refreshToken,
     
      };
}
class UserModel extends UserEntity {
  UserModel(
      {required int userId,
      required String firstName,
      required String lastName,
      required String email,
      String? avatar,
      String? phone})
      : super(
            userId: userId,
            email: email,
            firstName: firstName,
            lastName: lastName,
            avatar: avatar,
            phone: phone);

   factory UserModel.fromJson(
          Map<String, dynamic> json) =>
      UserModel(
        email: json['email'],
        userId: json['user_id'],
        phone: json['phone'],    
        firstName: json['first_name'],
        lastName: json['last_name'],
        avatar: json['avatar'],
      );

  Map<String, dynamic> toJson() => {
        'user_id': userId,
        'first_name': firstName,
        'last_name': lastName,
        'phone': phone,
        'avatar': avatar,
        'email':email
     
      };
}
