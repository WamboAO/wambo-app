import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';
import 'package:wambo/modules/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/presentation/services/startup_service.dart';
import 'package:wambo/app/locator.dart';

class StartupViewModel extends BaseViewModel {
  //LOCATOR
  final _startupService = locator<StartupService>();
  final _appConfigService = locator<AppConfigService>();
  //ENV VARIABLE SETUP
  get env => dotenv.env['ENVIROMENT'];
  //GLOBAL KEY FOR SERVICERS
  GlobalKey<NavigatorState>? get globalKey => StackedService.navigatorKey;
  Locale get aoLocale => const Locale('pt', 'pt_AO');
  
  //CURRENT USER INFO
  bool get isLoggedIn => _startupService.isLoggedIn;
  AppConfigurationEntity? get appConfig => _appConfigService.appConfiguration;
  Stream<ApiResponse<AuthenticatedUserEntity>> get currentUser => _startupService.currentUser;
  AuthenticatedUserEntity get noAuthUser => AuthenticatedUserEntity(
        token: "NO TOKEN",
        email: "",
        userId: 0,
        avatar: "",
        firstName: "",
        lastName: "",
        phone: "",
        refreshToken: "",
      );

  Future get getAuthenticatedUserLocaly => _startupService.getAuthenticatedUserLocaly();
}
