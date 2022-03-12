 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/modules/startup/presentation/view/startup_view.dart';

import 'app/imports.dart';

Future<void> main() async {
  CatcherService service = CatcherService(const StartupView());

  await dotenv.load(fileName: ".env").then((value) async {
    setupLocator(dotenv.env['BASE_URL'], enviroment: dotenv.env['ENVIROMENT']);
    await locator<DatabaseInitialization>().initialize();
    await locator<GetAuthenticatedUserService>().getUser();
    await locator<PermissionHandler>().requestPermission();
    await service.firebase;
  });
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  await service.catcher();
}
