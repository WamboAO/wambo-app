import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/app/setup.router.dart';
import 'app_view_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyAppModel>.nonReactive(
      builder: (context, model, child) {
        return MaterialApp(
          title: 'Wambo',
          locale: model.aoLocale,
          navigatorKey: model.globalKey,
                  onGenerateRoute: StackedRouter().onGenerateRoute,
          debugShowCheckedModeBanner: model.env == "debug" ? true: false,
          home: const Scaffold(),
        );
      },
      viewModelBuilder: () => MyAppModel(),
    );
  }
}
