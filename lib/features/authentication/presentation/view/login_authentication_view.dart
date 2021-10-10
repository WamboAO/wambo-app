import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/features/authentication/presentation/view/login_authentication_view_model.dart';

//Esta é a UI somente para visualização o resto vai para o viewmodel ou widgets.
class LoginAuthenticationView extends StatelessWidget {
  const LoginAuthenticationView({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginAuthenticationViewModel>.nonReactive(
      builder: (context, model, child) {
        return const Scaffold(
         body: Center(child: Text("LoginView"),),
        );
      },
      viewModelBuilder: () => LoginAuthenticationViewModel(),
    );
  }
}
