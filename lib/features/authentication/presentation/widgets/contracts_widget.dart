import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class Contracts extends StatelessWidget {
  const Contracts({
    required this.terms,
    required this.privacy,
    Key? key,
  }) : super(key: key);

  final Function terms;
  final Function privacy;
  

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: screenHeightPercentage(context, percentage: 0.15),
        decoration: BoxDecoration(
            color: kcSecondary,
            border: Border.all(
              color: kcSecondary,
            )),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: ktsSmallBodyText,
            children: <TextSpan>[
              const TextSpan(
                  text: 'Caso continuares, concordas com os nossos '),
              TextSpan(
                  text: 'Termos de Serviço',
                  style: ktsSmallBodyText.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => terms()),
              const TextSpan(text: ' e '),
              TextSpan(
                  text: 'Política de Privacidade',
                  style: ktsSmallBodyText.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => privacy() )
            ],
          ),
        ));
  }
}
