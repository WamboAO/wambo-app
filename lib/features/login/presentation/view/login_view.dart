import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/features/login/presentation/view/login_view_model.dart';

class LoginView extends StatelessWidget {
 const LoginView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<LoginViewModel>.reactive(
     builder: (context, model, child) {
        return const Scaffold();
        },
     viewModelBuilder: () => LoginViewModel(),
   );
 }
}