import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/presentation/view/forgot_password_authentication_view_model.dart';
import 'package:wambo/modules/authentication/presentation/widgets/authentication_layout_widget.dart';

class ForgotPasswordAuthenticationView extends HookWidget {
  const ForgotPasswordAuthenticationView(
      {Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    var email = useTextEditingController();
    var emailFocus = useFocusNode();
    return ViewModelBuilder<ForgotPasswordAuthenticationViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: kcIconDark),
                onPressed: () async {
                  if (emailFocus.hasFocus) {
                    emailFocus.unfocus();
                  }
                  email.clear();

                  await Future.delayed(const Duration(milliseconds: 150));
                  pageController.jumpToPage(1);
                },
              ),
            ),
            body: GestureDetector(
              onTap: () {
                if (emailFocus.hasFocus) {
                  emailFocus.unfocus();
                }
              },
              child: _FormInput(
                email: email,
                emailFocus: emailFocus,
                pageController: pageController,
              ),
            ));
      },
      viewModelBuilder: () => ForgotPasswordAuthenticationViewModel(),
    );
  }
}

class _FormInput
    extends ViewModelWidget<ForgotPasswordAuthenticationViewModel> {
  const _FormInput({
    required this.email,
    required this.emailFocus,
    required this.pageController,
    Key? key,
  }) : super(key: key, reactive: true);
  final TextEditingController email;
  final FocusNode emailFocus;
  final PageController pageController;

  @override
  Widget build(
    BuildContext context,
    ForgotPasswordAuthenticationViewModel model,
  ) {
    return AuthenticationLayoutWidget(
      onPressed: () {
        if (emailFocus.hasFocus) {
          emailFocus.unfocus();
        }
        // model
        //     .resetPassword(
        //       email: email.text,
        //     )
         //   .then((value) => pageController.jumpTo(0));
      },
      isBusy: model.isBusy,
      email: email,
      layoutType: LayoutType.forgot,
      emailFocus: emailFocus,
    );
  }
}
