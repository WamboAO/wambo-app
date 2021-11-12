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
import 'core/shared/hooks/permission_handler.dart';
import 'modules/startup/presentation/services/get_authenticated_user_service.dart';

Future<void> main() async {
  
  await dotenv.load(fileName: ".env").then((value) async {
          setupLocator(enviroment: dotenv.env['ENVIROMENT']);
          await locator<GetAuthenticatedUserService>().getUser();
          await locator<PermissionHandler>().requestPermission();
        });
  CatcherOptions debugOptions = CatcherOptions(SilentReportMode(), [
    ConsoleHandler(
      enableStackTrace: false,
      enableDeviceParameters: false
    ),
    DiscordHandler(
        "https://discordapp.com/api/webhooks/900402922058289242/XkdqibNEmQIGPEf8JR_dHZp1jsQYzMhHxBth6xfojCdMTzoQ0Tpr1ZTM0WmqgpyQ1sMb",
        enableDeviceParameters: true,
        enableApplicationParameters: true,
        enableCustomParameters: true,
        enableStackTrace: true,
       ),
    
  ], );

  // /// Release configuration. Same as above, but once user accepts dialog, user will be prompted to send email with crash to support.
  CatcherOptions releaseOptions = CatcherOptions(SilentReportMode(), [
    CrashlyticsHandler(
      printLogs: false
    ),
    DiscordHandler(
        "https://discordapp.com/api/webhooks/900402922058289242/XkdqibNEmQIGPEf8JR_dHZp1jsQYzMhHxBth6xfojCdMTzoQ0Tpr1ZTM0WmqgpyQ1sMb",
        enableDeviceParameters: true,
        enableApplicationParameters: true,
        enableCustomParameters: true,
        enableStackTrace: true,
       ),
  ]);
SystemChrome.setEnabledSystemUIMode(
            SystemUiMode.manual, overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  Catcher(
      rootWidget: const StartupView(),
      debugConfig: debugOptions,
      runAppFunction: () async {
    
       // screen direction
        
        await Firebase.initializeApp();
        //send all errors
        FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
        //load started logo
        await precachePicture(
            ExactAssetPicture(
                SvgPicture.svgStringDecoder, 'assets/images/wambo-login.svg'),
            null);
        //set Env
        
      },
      releaseConfig: releaseOptions,
      ensureInitialized: true);
}

