import 'package:wambo/modules/authentication/data/datasources/authentication_register_datasource.dart';
import 'package:wambo/modules/authentication/data/datasources/authentication_register_datasource_implementation.dart';
import 'package:wambo/modules/authentication/data/repositories/authentication_register_repository_implementation.dart';
import 'package:wambo/modules/authentication/domain/repositories/authentication_register_repository.dart';
import 'package:wambo/modules/authentication/domain/usecases/authentication_register_usecase.dart';
import 'package:wambo/modules/authentication/presentation/services/register_authentication_service.dart';

import 'imports.dart';

final GetIt locator = GetIt.I;

void setupLocator({String? enviroment}) {
  //STACKED SERVICES
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => StartupViewModel());

  //DDD
  startup();
  authentication();
  //CORE
  if (enviroment == 'debug') {
    locator
        .registerLazySingleton<ILocalStorage>(() => SharedLocalStorageTest());
    locator.registerLazySingleton<IRemote>(() => RemoteTestImplementation());
  }

  if (enviroment == 'dev' || enviroment == 'prod') {
    locator.registerLazySingleton<ILocalStorage>(() => SharedLocalStorage());
    locator.registerLazySingleton<IRemote>(() => RemoteImplementation());
  }
}

void startup() {
  locator.registerLazySingleton(() => StartupService(locator()));
  locator.registerLazySingleton(() => GetAuthenticatedUserLocaly(locator()));
  locator.registerLazySingleton<IAuthenticatedUserRepository>(
      () => AuthenticatedUserRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticatedUserDatasource>(
      () => AuthenticatedUserDatasourceImplementation(locator()));

//
  locator.registerFactory(() => AuthenticationService(locator()));
  locator.registerLazySingleton(() => AddAuthenticatedUserLocaly(locator()));
  locator.registerLazySingleton<IAuthenticateUserRepository>(
      () => AuthenticateUserRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticateUserDatasource>(
      () => AuthenticateUserDatasourceImplementation(locator()));

//
  locator.registerLazySingleton(() => AppConfigService(locator()));
  locator.registerLazySingleton(() => AppConfigurationSetupUsecase(locator()));
  locator.registerLazySingleton<IAppConfigurationSetupRepository>(
      () => AppConfigurationSetupRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAppConfigurationDatasource>(
      () => AppConfigurationDatasourceImplementation(locator()));
}

void authentication() {
  //social login
  locator.registerFactory(() => SocialAuthenticationService(locator()));
  locator
      .registerLazySingleton(() => AuthenticationWithSocialUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationWithSocialRepository>(
      () => AuthenticationWithSocialRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationWithSocialDatasource>(
      () => AuthenticationWithSocialDatasourceImplementation(locator()));
  locator.registerLazySingleton<ISocialLogin>(
      () => SocialInterfaceImplementation());
  //register
  locator.registerFactory(() => RegisterAuthenticationService(locator()));
  locator.registerLazySingleton(() => AuthenticationRegisterUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationRegisterRepository>(
      () => AuthenticationRegisterRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationRegisterDatasource>(
      () => AuthenticationRegisterDatasourceImplementation(locator()));
}
