import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/modules/startup/presentation/view/startup_view.dart';
import 'modules/startup/presentation/services/app_config_service.dart';
import 'modules/startup/presentation/services/startup_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoder, 'assets/images/wambo-login.svg'),
      null);

  await dotenv.load(fileName: ".env").then((value) async {
    setupLocator(enviroment: dotenv.env['ENVIROMENT']);
    await locator<AppConfigService>().appConfig();
    await locator<StartupService>().getAuthenticatedUserLocaly();
  });

  runApp(const StartupView());
}
