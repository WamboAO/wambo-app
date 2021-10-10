import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/features/authentication/domain/entities/user_registration_crendentials_entities.dart';
import 'package:wambo/features/authentication/domain/repositories/authentication_with_social_repository.dart';
import 'package:wambo/features/authentication/domain/usecases/authentication_with_social_usecase.dart';
import '../../../../mocks/authenticated_user_entity_mock.dart';

class MockAuthenticationWithSocialRepository extends Mock
    implements IAuthenticationWithSocialRepository {}

void main() {
  late AuthenticationWithSocialUsecase usecase;
  late IAuthenticationWithSocialRepository repository;
  group('AuthenticationWithSocialUsecaseTest -', () {
    setUp(() {
      repository = MockAuthenticationWithSocialRepository();
      usecase = AuthenticationWithSocialUsecase(repository);
    });
   Social tNoParams = Social.facebook;
    test('should return AuthenticatedUser from repository', () async {
      when(() => repository.loginWithSocial(tNoParams)).thenAnswer(
          (_) async => Right<Failure, UserRegistrationCredentialsEntity>(tUserRegistration));

      final result = await usecase(tNoParams);
      expect(result, Right(tUserRegistration));
      verify(() => repository.loginWithSocial(tNoParams)).called(1);
    });
    test('should return failure when errors occurs from the repository', () async {
      when(() => repository.loginWithSocial(tNoParams))
          .thenAnswer((_) async => Left<Failure, UserRegistrationCredentialsEntity>(FetchDataFailure()));

      final result = await usecase(tNoParams);
      expect(result, Left(FetchDataFailure()));
      verify(() => repository.loginWithSocial(tNoParams)).called(1);
    });
  });
}
