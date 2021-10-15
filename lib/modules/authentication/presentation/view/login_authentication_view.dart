import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/presentation/view/login_authentication_view_model.dart';
import 'package:wambo/modules/authentication/presentation/widgets/authentication_layout_widget.dart';

//Esta é a UI somente para visualização o resto vai para o viewmodel ou widgets.
class LoginAuthenticationView extends HookWidget {
  const LoginAuthenticationView({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    var email = useTextEditingController();
    final password = useTextEditingController();
    var emailFocus = useFocusNode();
    final passFocus = useFocusNode();
    return ViewModelBuilder<LoginAuthenticationViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: kcIconDark),
                onPressed: () async {
                  if (passFocus.hasFocus || emailFocus.hasFocus) {
                    passFocus.unfocus();
                    emailFocus.unfocus();
                  }
                  email.clear();

                  password.clear();
                  await Future.delayed(const Duration(milliseconds: 150));
                  pageController.jumpToPage(0);
                },
              ),
            ),
            body: GestureDetector(
                onTap: () {
                  if (passFocus.hasFocus || emailFocus.hasFocus) {
                    passFocus.unfocus();
                    emailFocus.unfocus();
                  }
                },
                child: _FormInput(
                  email: email,
                  passFocus: passFocus,
                  emailFocus: emailFocus,
                  password: password,
                  pageController: pageController,
                )));
      },
      viewModelBuilder: () => LoginAuthenticationViewModel(),
    );
  }
}

class _FormInput extends ViewModelWidget<LoginAuthenticationViewModel> {
  const _FormInput({
    required this.email,
    required this.password,
    required this.emailFocus,
    required this.passFocus,
    required this.pageController,
    Key? key,
  }) : super(key: key, reactive: true);
  final TextEditingController email, password;
  final FocusNode emailFocus, passFocus;
  final PageController pageController;

  @override
  Widget build(
    BuildContext context,
    LoginAuthenticationViewModel model,
  ) {
    return AuthenticationLayoutWidget(
      onPressed: () {
        if (passFocus.hasFocus || emailFocus.hasFocus) {
          passFocus.unfocus();
          emailFocus.unfocus();
        }
        model.login(
          email: email.text,
          password: password.text,
        );
      },
      facebook: () => model.loginWithSocial(Social.facebook),
      isBusy: model.isBusy,
      email: email,
      password: password,
      layoutType: LayoutType.login,
      emailFocus: emailFocus,
      passFocus: passFocus,
      onForgot: () => pageController.jumpToPage(3),
    );
  }
}
