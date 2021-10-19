import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wambo/modules/startup/data/datasources/authenticate_user_datasource_implementation.dart';
import 'package:wambo/modules/startup/data/models/authenticated_user_model.dart';

import '../../../../mocks/authenticated_user_entity_mock.dart';

class MockILocalStorage extends Mock implements ILocalStorage {}

void main() {
  group('AuthenticateUserRepositoryImplementationTest -', () {
    late AuthenticateUserDatasourceImplementation datasource;
    late ILocalStorage localStorage;

    setUp(() {
      localStorage = MockILocalStorage();
      datasource = AuthenticateUserDatasourceImplementation(localStorage);
    });
    const key = "auth";
    

    test('should call the method with the right key', () async {
      when(() => localStorage.put(key:any(), value:any())).thenAnswer((_) async => true);
      //  AuthenticatedUserModel _auth = AuthenticatedUserModel(
      //     token: tAuth.token,
      //     email: tAuth.email,
      //     refreshToken: tAuth.refreshToken,
      //     firstName: tAuth.firstName,
      //     lastName: tAuth.lastName,
      //     phone: tAuth.lastName,
      //     avatar: tAuth.avatar,
      //     userId: tAuth.userId,
      //     );

      await datasource.addAuthenticatedUserLocaly(tAuth);

      verify(() => localStorage.put(key:key, value: any())).called(1);
    });

    test('should return generic when is sucessful', () async {
      when(() => localStorage.put(key: any(),value: any())).thenAnswer((_) async => true);
       AuthenticatedUserModel _auth = AuthenticatedUserModel(
          token: tAuth.token,
           email: tAuth.email,
           appToken: tAuth.appToken,
          refreshToken: tAuth.refreshToken,
          firstName: tAuth.firstName,
          lastName: tAuth.lastName,
          phone: tAuth.lastName,
          avatar: tAuth.avatar,
          userId: tAuth.userId,
         );

      final result = await datasource.addAuthenticatedUserLocaly(tAuth);
      expect(result, tgeneric);
      verify(() => localStorage.put(key: key, value: jsonEncode(_auth))).called(1);
    });

    test('should return FetchDataException when the call is unsucessful', () async {
      when(() => localStorage.put(key: any(),value: any())).thenThrow(FetchDataException());
    AuthenticatedUserModel _auth = AuthenticatedUserModel(
          token: tAuth.token,
           email: tAuth.email,
           appToken: tAuth.appToken,
          refreshToken: tAuth.refreshToken,
          firstName: tAuth.firstName,
          lastName: tAuth.lastName,
          phone: tAuth.lastName,
          avatar: tAuth.avatar,
          userId: tAuth.userId,
         );

      final result = datasource.addAuthenticatedUserLocaly(tAuth);
      expect(result, throwsA(FetchDataException()));
      verify(() => localStorage.put(key: key, value:jsonEncode(_auth))).called(1);
    });
  });
}
