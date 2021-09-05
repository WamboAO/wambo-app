import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/base/exception_helpers.dart';
import 'package:wambo/core/usecase/usecase.dart';
import 'package:wambo/features/splash/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/features/splash/domain/repositories/authenticated_user_repository.dart';
import 'package:wambo/features/splash/domain/usecases/get_authenticated_user_localy_usecase.dart';

class MockAuthenticatedUserRepository extends Mock
    implements IAuthenticatedUserRepository {}

void main() {
  late GetAuthenticatedUserLocaly usecase;
  late IAuthenticatedUserRepository repository;
  group('GetAuthenticatedUserTest -', () {
    setUp(() {
      repository = MockAuthenticatedUserRepository();
      usecase = GetAuthenticatedUserLocaly(repository);
    });
    final tParams = NoParams();
    final tAuth =
        AuthenticatedUserEntity(token: "", userId: 0, refreshToken: "");
    test('should get authenticated user from the repository', () async {
      when(() => repository.getAuthenticatedUserLocaly()).thenAnswer(
          (_) async => Right<ExceptionHelper, AuthenticatedUserEntity>(tAuth));

      final result = await usecase(tParams);

      expect(result, Right(tAuth));
      verify(() => repository.getAuthenticatedUserLocaly()).called(1);
    });
    test('should get FetchDataException when an random error occurs', () async {
      when(() => repository.getAuthenticatedUserLocaly()).thenAnswer(
          (_) async => left<ExceptionHelper, AuthenticatedUserEntity>(FetchDataException()));

      final result = await usecase(tParams);

      expect(result, left(FetchDataException()));
      verify(() => repository.getAuthenticatedUserLocaly()).called(1);
    });
  });
}
