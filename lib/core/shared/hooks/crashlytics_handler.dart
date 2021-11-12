import 'package:catcher/catcher.dart';
import 'package:catcher/model/platform_type.dart';
import 'package:catcher/model/report_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:wambo/app/setup.logger.dart';

class CrashlyticsHandler extends ReportHandler {
   CrashlyticsHandler(
      {this.enableDeviceParameters = true,
      this.enableApplicationParameters = true,
      this.enableCustomParameters = true,
      this.printLogs = true})
   
      : assert(
            // ignore: unnecessary_null_comparison
            enableDeviceParameters != null,
            // ignore: unnecessary_null_comparison
            "enableDeviceParameters can't be null"),
        // ignore: unnecessary_null_comparison
        assert(enableApplicationParameters != null,
            "enableApplicationParameters can't be null"),
        // ignore: unnecessary_null_comparison
        assert(enableCustomParameters != null,
            "enableCustomParameters can't be null"),
        // ignore: unnecessary_null_comparison
        assert(printLogs != null, "printLogs can't be null");

  final _log = getLogger("CrashlyticsHandler");
  final bool enableDeviceParameters;
  final bool enableApplicationParameters;
  final bool enableCustomParameters;
  final bool printLogs;
 
  @override
  List<PlatformType> getSupportedPlatforms() {
    return [PlatformType.android, PlatformType.iOS];
  }

  @override
  // ignore: avoid_renaming_method_parameters
  Future<bool> handle(Report report, BuildContext? context) async {
    try {
     await Firebase.initializeApp();
      _printLog("Sending crashlytics report");
      final crashlytics = FirebaseCrashlytics.instance;
      crashlytics.setCrashlyticsCollectionEnabled(true);
      crashlytics.log(_getLogMessage(report));
      if (report.errorDetails != null) {
        // ignore: cast_nullable_to_non_nullable
        await crashlytics
            .recordFlutterError(report.errorDetails as FlutterErrorDetails);
      } else {
        await crashlytics.recordError(
            report.error, report.stackTrace as StackTrace);
      }
      _printLog("Crashlytics report sent");
      return true;
    } catch (exception) {
      _printLog("Failed to send crashlytics report: $exception");
      return false;
    }
  }

  String _getLogMessage(Report report) {
    StringBuffer buffer = StringBuffer("");
    if (enableDeviceParameters) {
      buffer.write("||| Device parameters ||| ");
      for (var entry in report.deviceParameters.entries) {
        buffer.write("${entry.key}: ${entry.value} ");
      }
    }
    if (enableApplicationParameters) {
      buffer.write("||| Application parameters ||| ");
      for (var entry in report.applicationParameters.entries) {
        buffer.write("${entry.key}: ${entry.value} ");
      }
    }
    if (enableCustomParameters) {
      buffer.write("||| Custom parameters ||| ");
      for (var entry in report.customParameters.entries) {
        buffer.write("${entry.key}: ${entry.value} ");
      }
    }
    return buffer.toString();
  }

  void _printLog(String log) {
    if (printLogs) {
      _log.i(log);
    }
  }
}
