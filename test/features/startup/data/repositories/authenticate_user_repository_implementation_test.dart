import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/features/startup/data/datasources/authenticate_user_datasource.dart';
import 'package:wambo/features/startup/data/models/generic_model.dart';
import 'package:wambo/features/startup/data/repositories/authenticate_user_repository_implementation.dart';

import '../../../../mocks/authenticated_user_entity_mock.dart';

class MockIAuthenticateUserDatasource extends Mock
    implements IAuthenticateUserDatasource {}

void main() {
  late AuthenticateUserRepositoryImplementation repository;
  late IAuthenticateUserDatasource datasource;
  group('AuthenticateUserRepositoryImplementationTest -', () {
    setUp(() {
      datasource = MockIAuthenticateUserDatasource();
      repository = AuthenticateUserRepositoryImplementation(datasource);
    });
    final tgen = GenericModel(message: "message");
    test('should return generic model when it calls the datasource', () async {
      when(() => datasource.addAuthenticatedUserLocaly(tAuth))
          .thenAnswer((_) async => tgen);
      final result = await repository.addAuthenticatedUserLocaly(tAuth);

      expect(result, Right(tgen));
      verify(() => datasource.addAuthenticatedUserLocaly(tAuth)).called(1);
    });
    test('should return FetchDataFailure  when data is not Generic model', () async {
      when(() => datasource.addAuthenticatedUserLocaly(tAuth))
          .thenThrow(FetchDataException());
      final result = await repository.addAuthenticatedUserLocaly(tAuth);

      expect(result, Left(FetchDataFailure()));
      verify(() => datasource.addAuthenticatedUserLocaly(tAuth)).called(1);
    });
  });
}
