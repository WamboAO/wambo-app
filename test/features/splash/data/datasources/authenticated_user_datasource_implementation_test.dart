import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/exception.dart';
import 'package:wambo/core/storage/local_storage_interface.dart';
import 'package:wambo/features/splash/data/datasources/authenticated_user_datasource.dart';
import 'package:wambo/features/splash/data/datasources/authenticated_user_datasource_implementation.dart';
import 'package:wambo/features/splash/data/models/authenticated_user_model.dart';
import '../../../../mocks/authenticated_user_mock.dart';

class MockILocalStorage extends Mock implements ILocalStorage {}

void main() {
  group('AuthenticatedUserDatasourceImplementationTest -', () {
    late IAuthenticatedUserDatasource datasource;
    late ILocalStorage localStorage;
    setUp(() {
      localStorage = MockILocalStorage();
      datasource = AuthenticatedUserDatasourceImplementation(localStorage);
    });

    const key = 'auth';

    final tsAuth = AuthenticatedUserModel(
        token:
            "ldfglkdfglkfdjhlkdfjghjrhlkerhtlkrejhtlfkdhglkdfhglreiuthoireuhfgldkghdslkgh3294234735lerthl453l245hl4kj5h",
        refreshToken: "43kjh534j5lkdgjh4lk6jh4536kl",
        userId: 0,
        isFirstTime: true);
    test('should call the method with the right key', () async {
      when(() => localStorage.get(any()))
          .thenAnswer((_) async => authenticatedUserMock);

      await datasource.getAuthenticatedUserLocaly();

      verify(() => localStorage.get(key)).called(1);
    });

    test('should return Authenticated User model when is successful', () async {
      when(() => localStorage.get(any()))
          .thenAnswer((_) async => authenticatedUserMock);

      final result = await datasource.getAuthenticatedUserLocaly();

      expect(result, tsAuth);
      verify(() => localStorage.get(key)).called(1);
    });

    test('should return FetchDataException when the call is unsucessful', () async {
      when(() => localStorage.get(any()))
          .thenAnswer((_) async => null);

      final result = datasource.getAuthenticatedUserLocaly();

      expect(()=>result, throwsA(FetchDataException()));
      verify(() => localStorage.get(key)).called(1);
    });
  });
}
