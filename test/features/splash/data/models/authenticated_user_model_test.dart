import 'package:flutter_test/flutter_test.dart';
import 'package:wambo/features/splash/data/models/authenticated_user_model.dart';
import 'package:wambo/features/splash/domain/entities/authenticated_user_entity.dart';

void main() {
  group('AuthenticatedUserModelTest -', () {
    final tAuthUser = AuthenticatedUserModel(
        token: "", userId: 1, refreshToken: "", isFirstTime: true);
    setUp(() {});

    test('should be a subclass of Authencticated User entity', () {
      expect(tAuthUser, isA<AuthenticatedUserEntity>());
    });
  });
}
