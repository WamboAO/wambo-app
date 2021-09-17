import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/features/startup/domain/entities/generic_entity.dart';
import 'package:wambo/features/startup/domain/repositories/authenticate_user_repository.dart';
import 'package:wambo/features/startup/domain/usecases/add_authenticated_user_localy_usecase.dart';

import '../../../../mocks/authenticated_user_entity_mock.dart';

class MockAuthenticateUserRepository extends Mock
    implements IAuthenticateUserRepository {}

void main() {
  late AddAuthenticatedUserLocaly usecase;
  late IAuthenticateUserRepository repository;

  group('AddAuthenticatedUserTest -', () {
    setUp(() {
      repository = MockAuthenticateUserRepository();
      usecase = AddAuthenticatedUserLocaly(repository);
    });

    test('should get generic from the repository', () async {
      when(() => repository.addAuthenticatedUserLocaly(tAuth))
          .thenAnswer((_) async => Right<Failure, GenericEntity>(tgeneric));

      final result = await usecase(tAuth);
      expect(result, Right(tgeneric));
      verify(() => repository.addAuthenticatedUserLocaly(tAuth)).called(1);
    });
  });
}
