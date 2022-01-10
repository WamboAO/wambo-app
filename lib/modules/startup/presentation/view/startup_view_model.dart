import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/core/shared/hooks/analytics_handler.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/core/shared/entities/authenticated_user_entity.dart';
import 'package:wambo/modules/startup/presentation/services/get_authenticated_user_service.dart';
import 'package:wambo/app/locator.dart';

class StartupViewModel extends FutureViewModel<void> {
  //LOCATORS
  final _snackbarService = locator<SnackbarService>();
  final _analyticsService = locator<AnalyticsHandler>();
  final _getAuthenticatedUserService = locator<GetAuthenticatedUserService>();
  //ENV VARIABLE SETUP
  get env => dotenv.env['ENVIROMENT'];
  //GLOBAL KEY FOR SERVICERS
  GlobalKey<NavigatorState>? get globalKey => StackedService.navigatorKey;
  Locale get aoLocale => const Locale('pt', 'pt_AO');

  //ANALYTICS
  FirebaseAnalyticsObserver get analyticsObs =>
      _analyticsService.getAnalyticsObserver();

  

  FirebaseAnalytics get analytics => _analyticsService.analytics;

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
