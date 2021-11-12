import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/app/lifecycle.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.router.dart';
import 'startup_view_model.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
     onModelReady: (model)=> model.setSnackBar(),
      builder: (context, model, child) {
        return LifeCycleManager(
          child: MaterialApp(
            title: 'Wambo',
            locale: model.aoLocale,
            theme: ThemeData(
              textTheme: GoogleFonts.rubikTextTheme(
                Theme.of(context).textTheme,
              ),
            ),
            navigatorKey: model.globalKey,
            navigatorObservers: [
              model.analyticsObs
            ],
            onGenerateRoute: StackedRouter().onGenerateRoute,
            initialRoute: Routes.mainView,
            debugShowCheckedModeBanner: model.env == "debug" ? true : false,
          ),
        );
      },
      viewModelBuilder: () => locator<StartupViewModel>(),
    );
  }
}
