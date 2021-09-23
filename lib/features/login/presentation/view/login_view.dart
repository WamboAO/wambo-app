import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/features/login/presentation/view/login_view_model.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
 //TODO: need to take out const sizes
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
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
                    Container(
                      margin: EdgeInsets.only(
                          bottom:
                              screenHeightPercentage(context, percentage: 0.1)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            color: Colors.green,
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            color: Colors.green,
                          ),
                        ],
                      ),
                    ),
                    SvgPicture.asset("assets/images/wambo-login.svg",
                        width: screenWidthPercentage(
                          context,
                          percentage: 0.4,
                        )),
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: screenHeightPercentage(context,
                              percentage: 0.065)),
                      child: Column(
                        children: [
                          Container(
                            width: 300,
                            height: 50,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: screenHeightPercentage(context,
                                percentage: 0.03),
                          ),
                          Container(
                            width: 300,
                            height: 50,
                            color: Colors.green,
                          ),
                          SizedBox(
                            height: screenHeightPercentage(context,
                                percentage: 0.03),
                          ),
                          if (Platform.isIOS) ...[
                            Container(
                              width: 300,
                              height: 50,
                              color: Colors.green,
                            ),
                          ]
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
              height: screenHeightPercentage(context, percentage: 0.15),
              decoration: BoxDecoration(
                  color: kcSecondary,
                  border: Border.all(
                    color: kcSecondary,
                  )),
              child: Text(
                "Lorem ipsum ave maria some some",
                textAlign: TextAlign.center,
                style: ktsSmallBodyText.copyWith(color: Colors.white),
              )),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
