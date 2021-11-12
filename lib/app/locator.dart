

import 'imports.dart';

final GetIt locator = GetIt.I;

void setupLocator({String? enviroment}) {
  //STACKED SERVICES
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => StartupViewModel());
  locator.registerLazySingleton(() => PermissionHandler());
  locator.registerLazySingleton(() => AnalyticsHandler());

  //DDD
  startup();
  authentication();

  // NETWORK
  locator.registerLazySingleton<INetworkInfo>(
      () => NetworkInformationImplementation());
  //CORE
  if (enviroment == 'debug') {
    locator.registerLazySingleton<ILocalStorage>(
        () => LocalStorageFkImplementation());
    locator.registerLazySingleton<IRemote>(() => RemoteFkImplementation());
  }

  if (enviroment == 'dev' || enviroment == 'prod') {
    locator.registerLazySingleton<ILocalStorage>(
        () => LocalStorageImplementation());
    locator.registerLazySingleton<IRemote>(() => RemoteImplementation());
  }
}

void startup() {
  //local auth
  locator.registerLazySingleton(() => GetAuthenticatedUserService(locator()));
  locator.registerLazySingleton(() => GetAuthenticatedUserUsecase(locator()));
  locator.registerLazySingleton<IGetAuthenticatedUserRepository>(() =>
      GetAuthenticatedUserRepositoryImplementation(
          locator(), locator(), locator()));
  locator.registerLazySingleton<IGetAuthenticatedUserRemotelyDatasource>(
      () => GetAuthenticatedUserRemotelyDatasourceImplementation(locator()));
  locator.registerLazySingleton<IGetAuthenticatedUserLocalyDatasource>(
      () => GetAuthenticatedUserLocalyDatasourceImplementation(locator()));
}

void authentication() {
  //acess login
  locator.registerFactory(() => AuthenticationService(locator()));
  locator.registerLazySingleton(() => AuthenticationUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationRepository>(() =>
      AuthenticationRepositoryImplementation(
          locator(), locator()));
  locator.registerLazySingleton<IAuthenticationDatasource>(() => locator());
  locator.registerLazySingleton<IAuthenticationWithSocialDatasource>(
      () => locator());
  //forgot
  locator.registerFactory(() => ResetPasswordAuthenticationService(locator()));
  locator.registerLazySingleton(
      () => AuthenticationForgotPasswordUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationForgotPasswordRepository>(
      () => AuthenticationForgotPasswordRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationForgotPasswordDatasource>(
      () => AuthenticationForgotPasswordDatasourceImplementation(locator()));
  //urLauncher
  locator.registerFactory(() => UrlLauncherService(locator()));
  locator.registerLazySingleton(() => UrlLauncherUsecase(locator()));
  locator.registerLazySingleton<IUrlLauncherRepository>(
      () => UrlLauncherRepositoryImplementation(locator()));
  locator.registerLazySingleton<IUrlLauncherDatasource>(
      () => UrlLauncherDatasourceImplementation());
}
