import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:wambo/core/errors/exception.dart';

mixin FacebookLoginMixin {
  final FacebookLogin facebook = FacebookLogin();
  Future loginWithFacebookHelper() async {
    final res = await facebook.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);

    switch (res.status) {
      case FacebookLoginStatus.success:
        final profile = await _getProfileInfo(facebook);
        final profileImage = await facebook.getProfileImageUrl(width: 200);
        final email = await _checkFacebookInfo(facebook.getUserEmail(),
            "a conta do Facebook não tem um e-mail associado a ela.");

        Map<String, Object?> result = {
          "email": email,
          "first_name": profile.firstName ?? profile.name,
          "last_name": profile.lastName,
          "avatar": profileImage,
          "registration_type": "facebook"
        };

        return result;
      case FacebookLoginStatus.cancel:
        throw FetchDataException(
            'Login facebook foi cancelado pelo utilizador');
      case FacebookLoginStatus.error:
        throw FetchDataException('Erro: ${res.error}');
    }
  }

  Future<void> facebookLogout() async {
   return await facebook.logOut();
  }

  Future<FacebookUserProfile> _getProfileInfo(FacebookLogin facebook) async {
    final profile = await facebook.getUserProfile();
    if (profile == null) {
      throw FetchDataException('Erro Desconhecido');
    } else {
      return profile;
    }
  }

  Future<String> _checkFacebookInfo(
      Future<String?> data, String errorMgs) async {
    final result = await data;
    if (result == null) {
      throw throw FetchDataException(errorMgs);
    } else {
      return result;
    }
  }
}
