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
  locator.registerLazySingleton(() => AuthenticationService(locator()));
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
  locator.registerLazySingleton(() => SocialAuthenticationService(locator()));
  locator
      .registerLazySingleton(() => AuthenticationWithSocialUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationWithSocialRepository>(
      () => AuthenticationWithSocialRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationWithSocialDatasource>(
      () => AuthenticationWithSocialDatasourceImplementation(locator()));
  locator.registerLazySingleton<ISocialLogin>(
      () => SocialInterfaceImplementation());
  
}
