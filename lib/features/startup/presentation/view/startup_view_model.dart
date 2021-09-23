import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/features/startup/presentation/services/startup_service.dart';
import 'package:wambo/app/locator.dart';

class StartupViewModel extends BaseViewModel {
  final _startupService = locator<StartupService>();
  get env => dotenv.env['ENVIROMENT'];
  GlobalKey<NavigatorState>? get globalKey => StackedService.navigatorKey;
  Locale get aoLocale => const Locale('pt', 'pt_AO');
  bool get isLoggedIn => _startupService.isLoggedIn;
}
