import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/presentation/view/register_authentication_view_model.dart';
import 'package:wambo/modules/authentication/presentation/widgets/authentication_layout_widget.dart';

//Esta é a UI somente para visualização o resto vai para o viewmodel ou widgets.
class RegisterAuthenticationView extends HookWidget {
  const RegisterAuthenticationView({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    final fname = useTextEditingController();
    final lname = useTextEditingController();
    final email = useTextEditingController();
    final password = useTextEditingController();
    final phone = useTextEditingController();
    final passFocus = useFocusNode();
    final emailFocus = useFocusNode();
    final firstFocus = useFocusNode();
    final lastFocus = useFocusNode();
    final phoneFocus = useFocusNode();
    return ViewModelBuilder<RegisterAuthenticationViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: kcIconDark),
                onPressed: () async {
                  if (passFocus.hasFocus ||
                      emailFocus.hasFocus ||
                      firstFocus.hasFocus ||
                      lastFocus.hasFocus ||
                      lastFocus.hasFocus ||
                      phoneFocus.hasFocus) {
                    passFocus.unfocus();
                    emailFocus.unfocus();
                    lastFocus.unfocus();
                    firstFocus.unfocus();
                    lastFocus.unfocus();
                    phoneFocus.unfocus();
                  }
                  email.clear();
                  fname.clear();
                  lname.clear();
                  phone.clear();
                  password.clear();
                  await Future.delayed(const Duration(milliseconds: 150));
                  pageController.jumpToPage(0);
                },
              ),
            ),
            body: GestureDetector(
              onTap: () {
                if (passFocus.hasFocus ||
                    emailFocus.hasFocus ||
                    firstFocus.hasFocus ||
                    lastFocus.hasFocus ||
                    lastFocus.hasFocus ||
                    phoneFocus.hasFocus) {
                  passFocus.unfocus();
                  emailFocus.unfocus();
                  lastFocus.unfocus();
                  firstFocus.unfocus();
                  lastFocus.unfocus();
                  phoneFocus.unfocus();
                }
              },
              child: _FormInput(
                email: email,
                lname: lname,
                password: password,
                fname: fname,
                phone: phone,
                emailFocus: emailFocus,
                firstFocus: firstFocus,
                passFocus: passFocus,
                phoneFocus: phoneFocus,
                lastFocus: lastFocus,
              ),
            ));
      },
      viewModelBuilder: () => RegisterAuthenticationViewModel(),
    );
  }
}

class _FormInput extends ViewModelWidget<RegisterAuthenticationViewModel> {
  const _FormInput({
    required this.email,
    required this.fname,
    required this.lname,
    required this.phone,
    required this.password,
    required this.emailFocus,
    required this.firstFocus,
    required this.lastFocus,
    required this.phoneFocus,
    required this.passFocus,
    Key? key,
  }) : super(key: key, reactive: true);
  final TextEditingController email, fname, lname, phone, password;
  final FocusNode emailFocus, firstFocus, lastFocus, phoneFocus, passFocus;

  @override
  Widget build(
    BuildContext context,
    RegisterAuthenticationViewModel model,
  ) {
    return AuthenticationLayoutWidget(
      onPressed: () {
        if (passFocus.hasFocus ||
            emailFocus.hasFocus ||
            firstFocus.hasFocus ||
            lastFocus.hasFocus ||
            lastFocus.hasFocus ||
            phoneFocus.hasFocus) {
          passFocus.unfocus();
          emailFocus.unfocus();
          lastFocus.unfocus();
          firstFocus.unfocus();
          lastFocus.unfocus();
          phoneFocus.unfocus();
        }
        // model.register(
        //     email: email.text,
        //     fname: fname.text,
        //     lname: lname.text,
        //     password: password.text,
        //     phone: phone.text);
      },
      facebook: () {
        if (passFocus.hasFocus ||
            emailFocus.hasFocus ||
            firstFocus.hasFocus ||
            lastFocus.hasFocus ||
            lastFocus.hasFocus ||
            phoneFocus.hasFocus) {
          passFocus.unfocus();
          emailFocus.unfocus();
          lastFocus.unfocus();
          firstFocus.unfocus();
          lastFocus.unfocus();
          phoneFocus.unfocus();
        }
       // model.loginWithSocial(Social.facebook);
      },
      //terms: ()=> model.getLink("sms:+244932254152"),
     // privacy: ()=> model.getLink("mailto:rcsousa14@hotmail.com"),
      isBusy: model.isBusy,
      email: email,
      phone: phone,
      password: password,
      layoutType: LayoutType.register,
      fname: fname,
      lname: lname,
      emailFocus: emailFocus,
      firstFocus: firstFocus,
      lastfocus: lastFocus,
      phoneFocus: phoneFocus,
      passFocus: passFocus,
    );
  }
}
