import 'package:wambo/core/interfaces/social_login_interface.dart';
import 'package:wambo/core/mixins/apple_login_mixin.dart';
import 'package:wambo/core/mixins/facebook_login_mixin.dart';
import 'package:wambo/core/mixins/google_login_mixin.dart';

class SocialInterfaceImplementation
    with FacebookLoginMixin, AppleLoginMixin, GoogleLoginMixin
    implements ISocialLogin {
  SocialInterfaceImplementation();

  @override
  Future<Map<String, Object?>> loginWithApple() async {
    return await loginWithAppleHelper();
  }

  @override
  Future<Map<String, Object?>> loginWithFacebook() async {
    return await loginWithFacebookHelper();
  }

  @override
  Future<Map<String, Object?>> loginWithGoogle() async {
    return await loginWithGoogle();
  }
}
