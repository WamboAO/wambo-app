import 'package:wambo/core/interfaces/social_login_interface.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/features/authentication/data/datasources/authentication_with_social_datasource.dart';
import 'package:wambo/features/authentication/data/models/user_registration_credentials_model.dart';

class AuthenticationWithSocialDatasourceImplementation
    implements IAuthenticationWithSocialDatasource {
  AuthenticationWithSocialDatasourceImplementation(
      this.social);
  final ISocialLogin social;

  @override
  Future<UserRegistrationCredentialsModel> loginWithSocial(
      Social params) async {
    switch (params) {
      case Social.facebook:
        return await socialHelper(social.loginWithFacebook());
      case Social.google:
        return await socialHelper(social.loginWithGoogle());
      case Social.apple:
        return await socialHelper(social.loginWithApple());
    }
    
  }

  Future<UserRegistrationCredentialsModel> socialHelper(Future data) async {
    try {
      final response = await data;
      return UserRegistrationCredentialsModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

 
}
