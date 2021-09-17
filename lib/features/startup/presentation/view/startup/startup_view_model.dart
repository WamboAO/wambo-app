import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/core/utils/data_state_response.dart';
import 'package:wambo/features/startup/domain/entities/authenticated_user_entity.dart';
import 'package:wambo/features/startup/presentation/services/startup_service.dart';
import 'package:wambo/core/app/locator.dart';

class StartupViewModel
    extends FutureViewModel<ApiResponse<AuthenticatedUserEntity>> {
  final _startupService = locator<StartupService>();
  get env => dotenv.env['ENVIROMENT'];
  GlobalKey<NavigatorState>? get globalKey => StackedService.navigatorKey;
  Locale get aoLocale => const Locale('pt', 'pt_AO');

  @override
  Future<ApiResponse<AuthenticatedUserEntity>> futureToRun() =>
      _startupService.getAuthenticatedUserLocaly();
}
