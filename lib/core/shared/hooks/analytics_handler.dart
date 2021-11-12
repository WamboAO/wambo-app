import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';

class AnalyticsHandler {
   FirebaseAnalytics get analytics => FirebaseAnalytics();

  FirebaseAnalyticsObserver getAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: analytics);

  

  
  Future<void> setCurrentScreen({required String screenName}) async {
   await analytics.setCurrentScreen(screenName: screenName);
  }
}
