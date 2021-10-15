import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class Contracts extends StatelessWidget {
  const Contracts({
    required this.terms,
    required this.privacy,
    this.backgroundColor,
    Key? key,
  }) : super(key: key);

  final Function terms;
  final Function privacy;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: screenHeightPercentage(context, percentage: 0.15),
        decoration: BoxDecoration(
            color: backgroundColor ?? kcSecondary,
            border: Border.all(
              color: backgroundColor ?? kcSecondary,
            )),
        child: AutoSizeText.rich(
          TextSpan(
            style: ktsSmallBodyText,
            children: <TextSpan>[
              TextSpan(
                  text: 'Caso continuares, concordas com os nossos ',
                  style: ktsSmallBodyText.copyWith(color: backgroundColor != null? kcIconDark : kcWhite  )),
              TextSpan(
                  text: 'Termos de Serviço',
                  style: ktsSmallBodyText.copyWith(
                      color: backgroundColor != null? kcPrimary : kcWhite,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = () => terms()),
              TextSpan(
                  text: ' e ',
                  style: ktsSmallBodyText.copyWith(color: backgroundColor != null? kcIconDark : kcWhite)),
              TextSpan(
                  text: 'Política de Privacidade',
                  style: ktsSmallBodyText.copyWith(
                      color: backgroundColor != null? kcPrimary : kcWhite,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = () => privacy())
            ],
          ),
          textAlign: TextAlign.center,
        ));
  }
}
