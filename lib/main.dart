import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:wambo/core/app/locator.dart';
import 'package:wambo/features/startup/presentation/view/startup/startup_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  await dotenv
      .load(fileName: ".env")
      .then((value) => setupLocator(enviroment: dotenv.env['ENVIROMENT']));
  
  runApp(const StartupView());
}
