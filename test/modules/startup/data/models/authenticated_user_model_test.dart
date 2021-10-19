import 'package:flutter_test/flutter_test.dart';
import 'package:wambo/modules/startup/data/models/authenticated_user_model.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';

void main() {
  group('AuthenticatedUserModelTest -', () {
    final tAuthUser = AuthenticatedUserModel(
        token: "", userId: 1, refreshToken: "", avatar: '', firstName: '', lastName: '', phone: '', email: '', appToken: '');
    setUp(() {});

    test('should be a subclass of Authencticated User entity', () {
      expect(tAuthUser, isA<AuthenticatedUserEntity>());
    });
  });
}
