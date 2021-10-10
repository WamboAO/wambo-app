import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/features/authentication/presentation/view/main_authentication_view_model.dart';
import 'authentication_view.dart';

class MainAuthenticationView extends HookWidget {
  const MainAuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageController = usePageController();
    return ViewModelBuilder<MainAuthenticationViewModel>.reactive(
      builder: (context, model, child) {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            const AuthenticationView()
            // const LoginView()
            // const RegisterView()
            // const ForgotPasswordView()
          ],

        );
      },
      viewModelBuilder: () => MainAuthenticationViewModel(),
    );
  }
}
