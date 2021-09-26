import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/features/authentication/domain/repositories/authentication_with_facebook_repository.dart';
import 'package:wambo/features/authentication/domain/usecases/authentication_with_facebook_usecase.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';

import '../../../../mocks/authenticated_user_entity_mock.dart';

class MockAuthenticationWithFacebookRepository extends Mock
    implements AuthenticationWithFacebookRepository {}

void main() {
  late AuthenticationWithFacebookUsecase usecase;
  late AuthenticationWithFacebookRepository repository;
  group('AuthenticationWithFacebookUsecaseTest -', () {
    setUp(() {
      repository = MockAuthenticationWithFacebookRepository();
      usecase = AuthenticationWithFacebookUsecase(repository);
    });
    final tNoParams = NoParams();
    test('should return AuthenticatedUser from repository', () async {
      when(() => repository.loginWithFacebook()).thenAnswer(
          (_) async => Right<Failure, AuthenticatedUserEntity>(tAuth));

      final result = await usecase(tNoParams);
      expect(result, Right(tAuth));
      verify(() => repository.loginWithFacebook()).called(1);
    });
    test('should return failure when errors occurs from the repository', () async {
      when(() => repository.loginWithFacebook())
          .thenAnswer((_) async => Left<Failure, AuthenticatedUserEntity>(FetchDataFailure()));

      final result = await usecase(tNoParams);
      expect(result, Left(FetchDataFailure()));
      verify(() => repository.loginWithFacebook()).called(1);
    });
  });
}
