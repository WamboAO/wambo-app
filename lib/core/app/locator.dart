import 'package:stacked_services/stacked_services.dart';
import 'package:get_it/get_it.dart';
import 'package:wambo/features/startup/domain/usecases/get_authenticated_user_localy_usecase.dart';
import 'package:wambo/features/startup/presentation/services/startup_service.dart';
import 'package:wambo/features/startup/domain/repositories/authenticated_user_repository.dart';
import 'package:wambo/features/startup/data/repositories/authenticated_user_repository.implementation.dart';
import 'package:wambo/features/startup/data/datasources/authenticated_user_datasource.dart';
import 'package:wambo/features/startup/data/datasources/authenticated_user_datasource_implementation.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:wambo/core/storage/local_storage_interface_implementation.dart';
import 'package:wambo/core/storage/local_storage_test_implementation.dart';

final GetIt locator = GetIt.I;

void setupLocator({String? enviroment}) {
  locator.registerFactory(() => StartupService(locator()));
  locator.registerLazySingleton(() => GetAuthenticatedUserLocaly(locator()));
  locator.registerLazySingleton<IAuthenticatedUserRepository>(
      () => AuthenticatedUserRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticatedUserDatasource>(
      () => AuthenticatedUserDatasourceImplementation(locator()));

  if (enviroment == 'debug') {
    locator
        .registerLazySingleton<ILocalStorage>(() => SharedLocalStorageTest());
  }
  if (enviroment == 'dev') {
    locator.registerLazySingleton<ILocalStorage>(() => SharedLocalStorage());
  }
  if (enviroment == 'prod') {}
}
