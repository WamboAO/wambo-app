import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/features/main/presentation/view/main_view_model.dart';

class MainView extends StatelessWidget {
 const MainView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<MainViewModel>.reactive(
     builder: (context, model, child) {
        return const Scaffold();
        },
     viewModelBuilder: () => MainViewModel(),
   );
 }
}