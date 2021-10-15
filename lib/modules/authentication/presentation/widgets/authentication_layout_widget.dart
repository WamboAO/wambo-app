import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/presentation/widgets/contracts_widget.dart';

class AuthenticationLayoutWidget extends StatelessWidget {
  const AuthenticationLayoutWidget({Key? key, required this.layoutType})
      : super(key: key);
  final LayoutType layoutType;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.account_circle_outlined,
                size: 45, color: kcIconDark),
            AutoSizeText(
              layoutType == LayoutType.login
                  ? "Log in"
                  : layoutType == LayoutType.register
                      ? "Registo"
                      : "Redefinição da Senha",
              style: ktsLargeBodyText.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            if (layoutType == LayoutType.register) ...[],
            SizedBox(
              height: screenWidthPercentage(context, percentage: 0.1),
            ),
            if (layoutType == LayoutType.login) ...[const _LoginWidget()],
            if (layoutType == LayoutType.register) ...[
              const _RegisterWidget()
            ],
            if (layoutType == LayoutType.forgot) ...[],
          ],
        ),
      ),
    );
  }
}

class _RegisterWidget extends StatelessWidget {
  const _RegisterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: screenWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             const Expanded(
               flex: 8,
               child:  Placeholder(
            fallbackWidth: double.infinity,
            fallbackHeight: 45,
          ),),
          const Spacer(),
          const Expanded(
            flex: 8,
            child:  Placeholder(
          
            fallbackWidth: double.infinity,
            fallbackHeight: 45,
          ),)
            ],
          ),
        ),
         SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        Contracts(
          backgroundColor: Colors.transparent,
            terms: () => print("terms"),
            privacy: () => print("privacy"),
          ),
          
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
         SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
      ],
    );
  }
}

class _LoginWidget extends StatelessWidget {
  const _LoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.01),
        ),
        AutoSizeText.rich(
          TextSpan(
            style: ktsSmallBodyText,
            children: <TextSpan>[
              TextSpan(
                  text: 'Esqueceu a Senha?',
                  style: ktsLargeBodyText.copyWith(
                      fontWeight: FontWeight.bold, color: kcPrimary),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => print("forgot")),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.035),
        ),
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.1),
        ),
        AutoSizeText("Sem uma conta?",
            style: ktsLargeBodyText.copyWith(fontWeight: FontWeight.bold)),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.02),
        ),
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        const Placeholder(
          fallbackWidth: double.infinity,
          fallbackHeight: 45,
        ),
        
      ],
    );
  }
}
