import 'package:catcher/catcher.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/core/shared/hooks/crashlytics_handler.dart';
import 'package:wambo/modules/startup/presentation/view/startup_view.dart';
import 'modules/startup/presentation/services/app_config_service.dart';
import 'modules/startup/presentation/services/startup_service.dart';


Future<void> main() async {
 
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
   CatcherOptions debugOptions =
       CatcherOptions(SilentReportMode(), [ConsoleHandler(), CrashlyticsHandler(), DiscordHandler(
         "https://discordapp.com/api/webhooks/900402922058289242/XkdqibNEmQIGPEf8JR_dHZp1jsQYzMhHxBth6xfojCdMTzoQ0Tpr1ZTM0WmqgpyQ1sMb",
         enableDeviceParameters: true,
         enableApplicationParameters: true,
         enableCustomParameters: true,
         enableStackTrace: true,
         printLogs: true),
]);
      
  /// Release configuration. Same as above, but once user accepts dialog, user will be prompted to send email with crash to support.
  CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [
    CrashlyticsHandler(),
    DiscordHandler(
         "https://discordapp.com/api/webhooks/900402922058289242/XkdqibNEmQIGPEf8JR_dHZp1jsQYzMhHxBth6xfojCdMTzoQ0Tpr1ZTM0WmqgpyQ1sMb",
         enableDeviceParameters: true,
         enableApplicationParameters: true,
         enableCustomParameters: true,
         enableStackTrace: true,
         printLogs: true),

  ]);
  await precachePicture(
      ExactAssetPicture(
          SvgPicture.svgStringDecoder, 'assets/images/wambo-login.svg'),
      null);

  await dotenv.load(fileName: ".env").then((value) async {
    setupLocator(enviroment: dotenv.env['ENVIROMENT']);
    await locator<AppConfigService>().appConfig();
    await locator<StartupService>().getAuthenticatedUserLocaly();
  });

  
   Catcher(rootWidget: const StartupView(), debugConfig: debugOptions, releaseConfig: releaseOptions);

 
}
