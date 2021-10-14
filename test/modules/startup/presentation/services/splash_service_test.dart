import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:wambo/core/errors/failures.dart';
import 'package:wambo/core/interfaces/usecase_interface.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/domain/usecases/get_authenticated_user_localy_usecase.dart';
import 'package:wambo/modules/startup/presentation/services/startup_service.dart';

import '../../../../mocks/authenticated_user_entity_mock.dart';

class MockGetAuthenticatedUserLocaly extends Mock
    implements GetAuthenticatedUserLocaly {}

void main() {
  late StartupService service;
  late GetAuthenticatedUserLocaly usecase;
  group('StartupServiceTest -', () {
    setUp(() {
      usecase = MockGetAuthenticatedUserLocaly();
      service = StartupService(usecase);
      registerFallbackValue<NoParams>(NoParams());
    });
    test('should return a Authenticated User from the usecase', () async {
      when(() => usecase(any())).thenAnswer((_) async => Right(tAuth));

      final result = await service.getAuthenticatedUserLocaly();
      expect(result, ApiResponse.completed(tAuth));
      verify(() => usecase(NoParams())).called(1);
    });
    final tFailure = FetchDataFailure();
    test('should return a Failure from the usecase', () async {
      when(() => usecase(any()))
          .thenAnswer((_) async => Left(tFailure));

      final result = await service.getAuthenticatedUserLocaly();
      expect(result, ApiResponse<AuthenticatedUserEntity>.error("$tFailure"));
      verify(() => usecase(NoParams())).called(1);
    });
  });
}
