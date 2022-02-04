import 'imports.dart';

final GetIt locator = GetIt.I;

void setupLocator(String? baseURL, {String? enviroment}) {
  //STACKED SERVICES
  locator.registerLazySingleton(() => DatabaseInitialization(locator()));
  locator.registerLazySingleton(() => DatabaseMigrationService());
  locator.registerLazySingleton<ILocalDatabaseSetup>(
      () => LocalDatabaseSetup(locator()));

  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => StartupViewModel());
  locator.registerLazySingleton(() => PermissionHandler());
  locator.registerLazySingleton(() => AnalyticsService());
  locator.registerLazySingleton(() => MainViewModel());

  //DDD
  startup();
  authentication();
  store();
  notification();
  search();
  products();
  url();

  // NETWORK
  locator.registerLazySingleton<INetwork>(() => NetworkImplementation());

  //CORE
  if (enviroment == 'debug') {
    locator.registerLazySingleton<ILocalDatabase>(
        () => LocalDatabaseFkImplementation());
    locator.registerLazySingleton<ILocalStorage>(
        () => LocalStorageFkImplementation());
    locator.registerLazySingleton<IRemote>(() => RemoteFkImplementation());
  }

  if (enviroment == 'dev' || enviroment == 'prod') {
    locator.registerLazySingleton<ILocalDatabase>(
        () => LocalDatabaseImplementation(locator()));
    locator.registerLazySingleton<ILocalStorage>(
        () => LocalStorageImplementation());
    locator
        .registerLazySingleton<IRemote>(() => RemoteImplementation(baseURL!));
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
  locator.registerLazySingleton<IAuthenticationRepository>(
      () => AuthenticationRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationDatasource>(() => locator());

  //forgot
  locator.registerFactory(() => ResetPasswordAuthenticationService(locator()));
  locator.registerLazySingleton(
      () => AuthenticationForgotPasswordUsecase(locator()));
  locator.registerLazySingleton<IAuthenticationForgotPasswordRepository>(
      () => AuthenticationForgotPasswordRepositoryImplementation(locator()));
  locator.registerLazySingleton<IAuthenticationForgotPasswordDatasource>(
      () => AuthenticationForgotPasswordDatasourceImplementation(locator()));
  
  

  
}

void store() {
//Store info
  locator.registerLazySingleton(() => GetStoreInfoService(locator()));
  locator.registerLazySingleton(() => GetStoreInfoUsecase(locator()));
  locator.registerLazySingleton<IGetStoreInfoRepository>(
      () => GetStoreInfoRepositoryImplementation(locator()));
  locator.registerLazySingleton<IGetStoreInfoDatasource>(
      () => GetStoreInfoDatasourceImplementation(locator()));

  //store categories
  locator.registerLazySingleton(() => GetCategoriesService(locator()));
  locator.registerLazySingleton(() => GetCategoriesUsecase(locator()));
  locator.registerLazySingleton<IGetCategoriesRepository>(
      () => GetCategoriesRepositoryImplementation(locator()));
  locator.registerLazySingleton<IGetCategoriesDatasource>(
      () => GetCategoriesDatasourceImplementation(locator()));
}

void products() {
  locator.registerFactory(() => ProductService(locator()));
  locator.registerLazySingleton(() => ProductsService(locator()));
  locator.registerLazySingleton(() => GetPromoService(locator()));
  locator.registerLazySingleton(() => GetPopularService(locator()));
  locator.registerLazySingleton(() => GetRecentService(locator()));
  locator.registerLazySingleton(() => GetForYouService(locator()));
  locator.registerLazySingleton(() => GetSuggestionService(locator()));
  locator.registerLazySingleton(() => ProductsUsecase(locator()));
  locator.registerLazySingleton(() => ProductUsecase(locator()));
  locator.registerLazySingleton<IProductsRepository>(
      () => ProductsRepositoryImplementation(locator()));
  locator.registerLazySingleton<IProductsDatasource>(
      () => ProductsDatasourceImplementation(locator()));
}

void search() {
  locator.registerLazySingleton(() => SearchService(locator()));
  locator.registerFactory(() => AddSearchService(locator()));
  locator.registerLazySingleton(() => SearchUsecase(locator()));
  locator.registerLazySingleton(() => AddSearchUsecase(locator()));
  locator.registerLazySingleton<ISearchRepository>(
      () => SearchRepositoryImplementation(locator(), locator()));
  locator.registerLazySingleton<ISearchLocalDatasource>(
      () => SearchLocalDatasourceImplementation(locator()));
  locator.registerLazySingleton<ISearchRemoteDatasource>(
      () => SearchRemoteDatasourceImplementation(locator()));
}

void notification() {
  locator.registerLazySingleton(() => GetNotificationService(locator()));
  locator.registerLazySingleton(() => GetNotificationUsecase(locator()));
  locator.registerLazySingleton<IGetNotificationRepository>(
      () => GetNotificationRepositoryImplementation(locator()));
  locator.registerLazySingleton<IGetNotificationDatasource>(
      () => GetNotificationDatasourceImplementation(locator()));
}

void url() {
  locator.registerFactory(() => UrlLauncherService(locator()));
  locator.registerLazySingleton(() => UrlLauncherUsecase(locator()));
  locator.registerLazySingleton<IUrlLauncherRepository>(
      () => UrlLauncherRepositoryImplementation(locator()));
  locator.registerLazySingleton<IUrlLauncherDatasource>(
      () => UrlLauncherDatasourceImplementation());
}
