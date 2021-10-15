import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/modules/authentication/presentation/view/forgot_password_authentication_view.dart';
import 'package:wambo/modules/authentication/presentation/view/login_authentication_view.dart';
import 'package:wambo/modules/authentication/presentation/view/main_authentication_view_model.dart';
import 'package:wambo/modules/authentication/presentation/view/register_authentication_view.dart';
import 'authentication_view.dart';

class MainAuthenticationView extends HookWidget {
  const MainAuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageController = usePageController();
    return ViewModelBuilder<MainAuthenticationViewModel>.reactive(
      builder: (context, model, child) {
        return WillPopScope(
          onWillPop: () async => false,
          child: PageView(
            physics: const NeverScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            controller: pageController,
            children: [
              
              AuthenticationView(pageController: pageController),
              LoginAuthenticationView(pageController: pageController),
              RegisterAuthenticationView(pageController: pageController),
              ForgotPasswordAuthenticationView(pageController: pageController)
            ],
          ),
        );
      },
      viewModelBuilder: () => MainAuthenticationViewModel(),
    );
  }
}
