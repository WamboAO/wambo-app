import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class Registration extends StatelessWidget {
  const Registration({
    required this.facebook,
    required this.apple,
    required this.email,
    Key? key,
  }) : super(key: key);

  final Function facebook;
  final Function apple;
  final Function email;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: screenHeightPercentage(context, percentage: 0.065)),
      child: FittedBox(
        child: Column(
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 5,
                    primary: Colors.white,
                    fixedSize: Size.fromWidth(
                        screenWidthPercentage(context, percentage: 0.75)),
                    padding: const EdgeInsets.all(20)),
                onPressed: () => facebook(),
                child: Text(
                  "Continua com Facebook",
                  style: ktsLargeBodyText.copyWith(color: Colors.blue),
                )),
            SizedBox(
              height: screenHeightPercentage(context, percentage: 0.02),
            ),
            if (Platform.isIOS) ...[
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 5,
                      primary: Colors.black,
                      fixedSize: Size.fromWidth(
                          screenWidthPercentage(context, percentage: 0.75)),
                      padding: const EdgeInsets.all(20)),
                  onPressed: () => apple(),
                  child: Text(
                    "Continua com Apple",
                    style: ktsLargeBodyText.copyWith(color: Colors.white),
                  )),
              SizedBox(
                height: screenHeightPercentage(context, percentage: 0.02),
              ),
            ],
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 3,
                    primary: kcPrimary,
                    fixedSize: Size.fromWidth(
                        screenWidthPercentage(context, percentage: 0.75)),
                    padding: const EdgeInsets.all(20)),
                onPressed: () => email(),
                child: Text(
                  "Inscreve-se com Email",
                  style: ktsLargeBodyText.copyWith(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}