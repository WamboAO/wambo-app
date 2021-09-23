import 'package:get_it/get_it.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/features/login/data/datasources/authenticate_user_datasource.dart';
import 'package:wambo/features/login/data/datasources/authenticate_user_datasource_implementation.dart';
import 'package:wambo/features/login/domain/usecases/add_authenticated_user_localy_usecase.dart';
import 'package:wambo/features/startup/domain/usecases/get_authenticated_user_localy_usecase.dart';
import 'package:wambo/features/login/presentation/services/auth_service.dart';
import 'package:wambo/features/startup/presentation/services/startup_service.dart';
import 'package:wambo/features/login/domain/repositories/authenticate_user_repository.dart';
import 'package:wambo/features/startup/domain/repositories/authenticated_user_repository.dart';
import 'package:wambo/features/login/data/repositories/authenticate_user_repository_implementation.dart';
import 'package:wambo/features/startup/data/repositories/authenticated_user_repository.implementation.dart';
import 'package:wambo/features/startup/data/datasources/authenticated_user_datasource.dart';
import 'package:wambo/features/startup/data/datasources/authenticated_user_datasource_implementation.dart';
import 'package:wambo/core/interfaces/local_storage_interface.dart';
import 'package:wambo/core/storage/local_storage_interface_implementation.dart';
import 'package:wambo/core/storage/local_storage_test_implementation.dart';

final GetIt locator = GetIt.I;

void setupLocator({String? enviroment}) {
  //STACKED SERVICES
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  
  //DDD
  startup();
  auth();
  //CORE
  if (enviroment == 'debug') {
    locator
        .registerLazySingleton<ILocalStorage>(() => SharedLocalStorageTest());
  }
  if (enviroment == 'dev') {
    locator.registerLazySingleton<ILocalStorage>(() => SharedLocalStorage());
  }
  if (enviroment == 'prod') {
    locator.registerLazySingleton<ILocalStorage>(() => SharedLocalStorage());
  }
}

void startup() {
  locator.registerLazySingleton(() => StartupService(locator()));
  locator.registerLazySingleton(() => GetAuthenticatedUserLocaly(locator()));
  locator.registerLazySingleton<IAuthenticatedUserRepository>(
      () => AuthenticatedUserRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticatedUserDatasource>(
      () => AuthenticatedUserDatasourceImplementation(locator()));
}

void auth() {
  locator.registerLazySingleton(() => AuthService(locator()));
  locator.registerLazySingleton(() => AddAuthenticatedUserLocaly(locator()));
  locator.registerLazySingleton<IAuthenticateUserRepository>(
      () => AuthenticateUserRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticateUserDatasource>(
      () => AuthenticateUserDatasourceImplementation(locator()));
}
