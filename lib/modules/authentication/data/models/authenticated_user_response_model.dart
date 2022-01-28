class AuthenticatedUserResponseModel {
  AuthenticatedUserResponseModel({required this.message, this.data});
  AuthenticatedUserResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
  late String message;
  UserData? data;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class UserData {
  UserData(
      {required this.token, required this.refreshToken, required this.user});

  UserData.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refresh_token'];
    user = User.fromJson(json['user']);
  }
  late String token;
  late String refreshToken;
  late User user;

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['refresh_token'] = refreshToken;
    data['user'] = user.toJson();
    return data;
  }
}

class User {
  User(
      {required this.id,
       required this.email,
       this.name,
       this.phone,
       this.birthday,
       this.gender,
       this.avatar,
       this.address,
      required this.role,
      required this.createdAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    birthday = json['birthday'];
    gender = json['gender'];
    avatar = json['avatar'];
    address = json['address'];
    role = json['role'];
    createdAt = json['created_at'];
  }
  late int id;
  late String email;
   String? name;
   String? phone;
   String? birthday;
   String? gender;
   String? avatar;
   String? address;
  late String role;
  late String createdAt;

  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['gender'] = gender;
    data['avatar'] = avatar;
    data['address'] = address;
    data['role'] = role;
    data['created_at'] = createdAt;
    return data;
  }
}
