import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/features/main/presentation/view/main_view_model.dart';

class MainView extends StatelessWidget {
 const MainView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<MainViewModel>.reactive(
     builder: (context, model, child) {
        return WillPopScope(
          onWillPop:  () async => false,
          child: const Scaffold(
            body: Center(child: Text("mainview"),),
          ),
        );
        },
     viewModelBuilder: () => MainViewModel(),
   );
 }
}