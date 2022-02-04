
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/app/imports.dart';
import 'package:interfaces/interfaces.dart';
import 'package:wambo/modules/authentication/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/app/locator.dart';

class StartupViewModel extends FutureViewModel<void> {
  //LOCATORS
  final _snackbarService = locator<SnackbarService>();
  final _analyticsService = locator<AnalyticsService>();
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  //ENV VARIABLE SETUP
  get env => dotenv.env['ENVIROMENT'];
  //GLOBAL KEY FOR SERVICERS
  GlobalKey<NavigatorState>? get globalKey => StackedService.navigatorKey;
  Locale get aoLocale => const Locale('pt', 'pt_AO');

  //ANALYTICS
   get analyticsObs =>
      _analyticsService.getAnalyticsObserver();

  

   get analytics => _analyticsService.analytics;

  //CURRENT USER INFO
  AuthenticatedUserEntity? get currentUser =>
      _getAuthenticatedUserService.currentUser;
  Stream<ApiResponse<AuthenticatedUserEntity>> get currentUserStream =>
      _getAuthenticatedUserService.dataStream;

  Future<void> setSnackBar() async {
    _snackbarService.registerSnackbarConfig(SnackbarConfig(
        snackStyle: SnackStyle.GROUNDED,
        animationDuration: const Duration(milliseconds: 300),
        messageColor: Colors.white,
        messageTextAlign: TextAlign.center));
  }

  @override
  Future futureToRun() => analytics.logAppOpen();
}
