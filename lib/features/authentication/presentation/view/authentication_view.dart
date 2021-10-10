import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/features/authentication/presentation/view/authentication_view_model.dart';
import 'package:wambo/features/authentication/presentation/widgets/contracts_widget.dart';
import 'package:wambo/features/authentication/presentation/widgets/registration_widget.dart';
import 'package:wambo/features/authentication/presentation/widgets/top_header_widget.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key, required this.pageController}) : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Container(
            width: screenWidth(context),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [kcPrimary, kcSecondary],
            )),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    TopHeaderLogin(
                      cancel: () => model.cancelAuthentication(),
                      login: () => print("login"),
                    ),
                    SvgPicture.asset("assets/images/wambo-login.svg",
                        width: screenWidthPercentage(
                          context,
                          percentage: 0.4,
                        )),
                    Registration(
                      apple: () => model.loginWithApple(),
                      facebook: () => model.loginWithFacebook(),
                      email: () => print("email"),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Contracts(
            terms: () => print("terms"),
            privacy: () => print("privacy"),
          ),
        );
      },
      viewModelBuilder: () => AuthenticationViewModel(),
    );
  }
}
