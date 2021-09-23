import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/app/setup.router.dart';
import 'startup_view_model.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.nonReactive(
      builder: (context, model, child) {
        return MaterialApp(
          title: 'Wambo',
          locale: model.aoLocale,
          navigatorKey: model.globalKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          initialRoute:
              model.isLoggedIn == true ? Routes.mainView : Routes.loginView,
          debugShowCheckedModeBanner: model.env == "debug" ? true : false,
        );
      },
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
