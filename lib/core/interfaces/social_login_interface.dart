
abstract class ISocialLogin {
  Future<Map<String, Object?>> loginWithFacebook();
  Future<Map<String, Object?>> loginWithApple();
  Future<Map<String, Object?>> loginWithGoogle();
}
