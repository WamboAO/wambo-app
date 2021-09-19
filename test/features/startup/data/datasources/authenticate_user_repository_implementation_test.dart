import 'dart:convert';

import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wambo/features/startup/data/datasources/authenticate_user_datasource_implementation.dart';
import 'package:wambo/features/startup/data/models/authenticated_user_model.dart';
import 'package:wambo/features/startup/data/models/generic_model.dart';

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
    final tgen = GenericModel(message: "");

    test('should call the method with the right key', () async {
      when(() => localStorage.put(any(), any())).thenAnswer((_) async => true);
       AuthenticatedUserModel _auth = AuthenticatedUserModel(
          token: tAuth.token,
          refreshToken: tAuth.refreshToken,
          username: tAuth.username,
          avatar: tAuth.avatar,
          userId: tAuth.userId,
          isFirstTime: tAuth.isFirstTime);

      await datasource.addAuthenticatedUserLocaly(tAuth);

      verify(() => localStorage.put(key, any())).called(1);
    });

    test('should return generic when is sucessful', () async {
      when(() => localStorage.put(any(), any())).thenAnswer((_) async => true);
       AuthenticatedUserModel _auth = AuthenticatedUserModel(
          token: tAuth.token,
          refreshToken: tAuth.refreshToken,
          username: tAuth.username,
          avatar: tAuth.avatar,
          userId: tAuth.userId,
          isFirstTime: tAuth.isFirstTime);

      final result = await datasource.addAuthenticatedUserLocaly(tAuth);
      expect(result, tgen);
      verify(() => localStorage.put(key, jsonEncode(_auth))).called(1);
    });

    test('should return FetchDataException when the call is unsucessful', () async {
      when(() => localStorage.put(any(), any())).thenAnswer((_) async => false);
      AuthenticatedUserModel _auth = AuthenticatedUserModel(
          token: tAuth.token,
          refreshToken: tAuth.refreshToken,
          username: tAuth.username,
          avatar: tAuth.avatar,
          userId: tAuth.userId,
          isFirstTime: tAuth.isFirstTime);

      final result = datasource.addAuthenticatedUserLocaly(tAuth);
      expect(result, throwsA(FetchDataException()));
      verify(() => localStorage.put(key, jsonEncode(_auth))).called(1);
    });
  });
}
