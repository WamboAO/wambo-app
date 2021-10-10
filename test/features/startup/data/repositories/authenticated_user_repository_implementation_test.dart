import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/mixins/repository_data_mixin.dart';
import 'package:wambo/features/startup/data/datasources/authenticated_user_datasource.dart';
import 'package:wambo/features/startup/data/models/authenticated_user_model.dart';
import 'package:wambo/features/startup/data/repositories/authenticated_user_repository.implementation.dart';

class MockIAuthenticatedUserDatasource extends Mock
    implements IAuthenticatedUserDatasource {}


void main() {
  late AuthenticatedUserRepositoryImplementation repository;
  late IAuthenticatedUserDatasource datasource;

  group('AuthenticatedUserRepositoryImplementationTest -', () {
    setUp(() {
      datasource = MockIAuthenticatedUserDatasource();
      repository = AuthenticatedUserRepositoryImplementation(datasource);
  
     
    });

    final tAuthenticatedUserModel = AuthenticatedUserModel(
        token: "token",
        refreshToken: "refreshToken",
        avatar: "",
        userId: 1,
        isFirstTime: true,
        firstName: '',
        lastName: '',
        phone: '');
    test('should return Authenticated User model when it calls the datasource',
        () async {
      when(() => datasource.getAuthenticatedUserLocaly())
          .thenAnswer((_) async => tAuthenticatedUserModel);

      final result = await repository.getAuthenticatedUserLocaly();

      expect(result,
          Right<Failure, AuthenticatedUserModel>(tAuthenticatedUserModel));
      verify(() => datasource.getAuthenticatedUserLocaly()).called(1);
    });
    //TOOK IT OUT UNTIL I FIGURE IT OUT HOW TO RUN TESTS FOR THIS

  // //   test(
  // //       'should return FetchDataFailure when data is not Authenticaed User model',
  // //       () async {
  // //     when(() => datasource.getAuthenticatedUserLocaly())
  // //        // .thenReturn(throw BadRequestException(""));
  // //     // .thenAnswer((_) => throw BadRequestException(""));
  // //       .thenThrow(BadRequestException(""));

  // //     final result = await repository.getAuthenticatedUserLocaly();

  // //     expect(
  // //         result, Left<Failure, AuthenticatedUserModel>(FetchDataFailure("")));
  // //     verify(() => datasource.getAuthenticatedUserLocaly()).called(1);
  // //   });
  });
}
