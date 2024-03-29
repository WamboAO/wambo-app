import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/presentation/view/authentication_view_model.dart';
import 'package:wambo/modules/authentication/presentation/widgets/contracts_widget.dart';
import 'package:wambo/modules/authentication/presentation/widgets/registration_widget.dart';
import 'package:wambo/modules/authentication/presentation/widgets/top_header_widget.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.nonReactive(
      builder: (context, model, child) {
        return const Scaffold(
          // body: Container(
          //   width: screenWidth(context),
          //   decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomCenter,
          //     colors: [kcPrimary, kcSecondary],
          //   )),
          //   child: SafeArea(
          //     child: Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: Column(
          //         children: [
          //           TopHeaderLogin(
          //             cancel: () => model.cancelAuthentication(),
          //             login: () => pageController.animateToPage(1,
          //                 duration: const Duration(milliseconds: 250),
          //                 curve: Curves.easeOut),
          //           ),
          //           SvgPicture.asset("assets/images/wambo-login.svg",
          //               width: screenWidthPercentage(
          //                 context,
          //                 percentage: 0.4,
          //               )),
          //               _Register(pageController: pageController)
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // bottomNavigationBar: Contracts(
          //   terms: () => model.getLink("tel:+244932254152"),
          //   privacy: () =>
          //       model.getLink("https://pub.dev/packages/url_launcher/example"),
          // ),
        );
      },
      viewModelBuilder: () => AuthenticationViewModel(),
    );
  }
}


