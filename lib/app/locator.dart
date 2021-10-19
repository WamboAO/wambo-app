

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
  //startup
  locator.registerLazySingleton(() => StartupService(locator()));
  locator.registerLazySingleton(() => GetAuthenticatedUserLocaly(locator()));
  locator.registerLazySingleton<IAuthenticatedUserRepository>(
      () => AuthenticatedUserRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticatedUserDatasource>(
      () => AuthenticatedUserDatasourceImplementation(locator()));

//authentication
  locator.registerFactory(() => AuthenticationService(locator()));
  locator.registerLazySingleton(() => AddAuthenticatedUserLocaly(locator()));
  locator.registerLazySingleton<IAuthenticateUserRepository>(
      () => AuthenticateUserRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticateUserDatasource>(
      () => AuthenticateUserDatasourceImplementation(locator()));

//app config
  locator.registerLazySingleton(() => AppConfigService(locator()));
  locator.registerLazySingleton(() => AppConfigurationSetupUsecase(locator()));
  locator.registerLazySingleton<IAppConfigurationSetupRepository>(
      () => AppConfigurationSetupRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAppConfigurationDatasource>(
      () => AppConfigurationDatasourceImplementation(locator()));
//refresh token
  locator.registerFactory(() => RefreshTokenService(locator()));
  locator.registerLazySingleton(() => GetRefreshTokenUsecase(locator()));
  locator.registerLazySingleton<IGetRefreshTokenRepository>(
      () => GetRefreshTokenRepositoryImplementation(locator()));
  locator.registerLazySingleton<IGetRefreshTokenDatasource>(
      () => GetRefreshTokenDatasourceImplementation(locator()));
}

void authentication() {
  //social login
  locator.registerFactory(() => SocialAuthenticationService(locator()));
  locator.registerFactory(() => SocialAuthenticaionResponseService(locator()));
  locator
      .registerLazySingleton(() => AuthenticationWithSocialUsecase(locator()));
  locator.registerLazySingleton(
      () => AuthenticationSocialResponseUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationWithSocialRepository>(
      () => AuthenticationWithSocialRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationSocialResponseRepository>(
      () => AuthenticationSocialResponseRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationWithSocialDatasource>(
      () => AuthenticationWithSocialDatasourceImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationSocialResponseDatasource>(
      () => AuthenticationSocialResponseDatasourceImplementation(locator()));
  locator.registerLazySingleton<ISocialLogin>(
      () => SocialInterfaceImplementation());
  //register
  locator.registerFactory(() => RegisterAuthenticationService(locator()));
  locator.registerLazySingleton(() => AuthenticationRegisterUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationRegisterRepository>(
      () => AuthenticationRegisterRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationRegisterDatasource>(
      () => AuthenticationRegisterDatasourceImplementation(locator()));

  //login
  locator.registerFactory(() => LoginAuthenticationService(locator()));
  locator.registerLazySingleton(() => AuthenticationLoginUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationLoginRepository>(
      () => AuthenticationLoginRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationLoginDatasource>(
      () => AuthenticationLoginDatasourceImplementation(locator()));
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
