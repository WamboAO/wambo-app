import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/features/authentication/data/datasources/authentication_with_social_datasource_implementation.dart';

class MockISocialLogin extends Mock implements ISocialLogin {}

void main() {
  group('AuthenticationWithFacebookDatasourceImplementation -', () {
    late AuthenticationWithSocialDatasourceImplementation datasource;
    late ISocialLogin social;

    setUp(() {
      social = MockISocialLogin();
      datasource = AuthenticationWithSocialDatasourceImplementation(social);
    });

    test('', () {});
  });
}
