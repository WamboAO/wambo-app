import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/busy_button_widget.dart';
import 'package:wambo/core/shared/widgets/text_field_widget.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/presentation/widgets/contracts_widget.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

class AuthenticationLayoutWidget extends StatelessWidget {
  const AuthenticationLayoutWidget(
      {Key? key,
      required this.layoutType,
      required this.email,
      required this.isBusy,
      this.onPressed,
      this.facebook,
      this.password,
      this.fname,
      this.lname,
      this.phone,
      this.onForgot,
      required this.emailFocus,
      this.firstFocus,
      this.lastfocus,
      this.privacy,
      this.terms,
      this.phoneFocus,
      this.passFocus})
      : super(key: key);
  final LayoutType layoutType;
  final bool isBusy;
  final Function? onForgot, onPressed, facebook, terms, privacy;
  final TextEditingController email;
  final FocusNode emailFocus;
  final FocusNode? firstFocus, lastfocus, phoneFocus, passFocus;
  final TextEditingController? fname, lname, phone, password;

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
            if (layoutType == LayoutType.register) ...[
              SizedBox(
                height: screenWidthPercentage(context, percentage: 0.03),
              ),
              const AutoSizeText(
                "Criar uma conta para que possa comprar os seus produtos favoritos",
                style: ktsMediumBodyText,
                textAlign: TextAlign.center,
              ),
            ],
            if (layoutType == LayoutType.forgot) ...[
              SizedBox(
                height: screenWidthPercentage(context, percentage: 0.03),
              ),
              const AutoSizeText(
                "Digite o seu e-mail e enviaremos um link para redefinir a sua senha",
                style: ktsMediumBodyText,
                textAlign: TextAlign.center,
              ),
            ],
            SizedBox(
              height: screenWidthPercentage(context, percentage: 0.1),
            ),
            if (layoutType == LayoutType.login) ...[
              _LoginWidget(
                onPressed: () => onPressed!(),
                facebook: () => facebook!(),
                isBusy: isBusy,
                email: email,
                emailFocus: emailFocus,
                passFocus: passFocus!,
                password: password!,
                onForgot: () => onForgot!(),
              )
            ],
            if (layoutType == LayoutType.register) ...[
              _RegisterWidget(
                facebook: () => facebook!(),
                onPressed: () => onPressed!(),
                terms: () => terms!(),
                privacy: () => privacy!(),
                isBusy: isBusy,
                fname: fname!,
                lname: lname!,
                email: email,
                phone: phone!,
                password: password!,
                emailFocus: emailFocus,
                firstFocus: firstFocus!,
                lastFocus: lastfocus!,
                passFocus: passFocus!,
                phoneFocus: phoneFocus!,
              )
            ],
            if (layoutType == LayoutType.forgot) ...[
              _ForgotPasswordWidget(
                email: email,
                emailFocus: emailFocus,
                isBusy: isBusy,
                onPressed: () => onPressed!(),
              )
            ],
          ],
        ),
      ),
    );
  }
}

class _ForgotPasswordWidget extends StatelessWidget {
  const _ForgotPasswordWidget(
      {Key? key,
      required this.email,
      required this.emailFocus,
      required this.isBusy,
      required this.onPressed})
      : super(key: key);
  final TextEditingController email;
  final FocusNode emailFocus;
  final bool isBusy;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewFormTextField(
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                onPressed();
              }
            },
            controller: email,
            focus: emailFocus,
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email_rounded,
            text: "Email",
            formater: [
              FilteringTextInputFormatter.deny(
                RegExp('[<>]'),
              ),
            ]),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.1),
        ),
        BusyBtn(
          busy: isBusy,
          tap: () => onPressed(),
          txtColor: kcWhite,
          btnColor: Colors.black,
          text: "Continuar",
        ),
      ],
    );
  }
}

class _RegisterWidget extends StatelessWidget {
  const _RegisterWidget(
      {Key? key,
      required this.facebook,
      required this.fname,
      required this.lname,
      required this.email,
      required this.isBusy,
      required this.onPressed,
      required this.terms,
      required this.privacy,
      required this.password,
      required this.phone,
      required this.emailFocus,
      required this.firstFocus,
      required this.lastFocus,
      required this.passFocus,
      required this.phoneFocus})
      : super(key: key);
  final TextEditingController fname, lname, email, phone, password;
  final FocusNode firstFocus, lastFocus, emailFocus, phoneFocus, passFocus;
  final Function facebook, onPressed, terms, privacy;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    PhoneInputFormatter.replacePhoneMask(
        countryCode: "AO", newMask: '+000 000 000 000');
    PhoneInputFormatter.addAlternativePhoneMasks(
      countryCode: 'AO',
      alternativeMasks: ['000 000 000'],
    );
    return Column(
      children: [
        Container(
          width: screenWidth(context),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 8,
                child: NewFormTextField(
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    controller: fname,
                    focus: firstFocus,
                    keyboardType: TextInputType.text,
                    icon: Icons.account_circle,
                    text: "Nome",
                    formater: [
                      FilteringTextInputFormatter.deny(
                        RegExp('[<>]'),
                      ),
                    ]),
              ),
              const Spacer(),
              Expanded(
                flex: 8,
                child: NewFormTextField(
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.next,
                    controller: lname,
                    focus: lastFocus,
                    keyboardType: TextInputType.text,
                    icon: Icons.account_circle,
                    text: "Último nome",
                    formater: [
                      FilteringTextInputFormatter.deny(
                        RegExp('[<>]'),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        NewFormTextField(
            textInputAction: TextInputAction.next,
            controller: email,
            focus: emailFocus,
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email_rounded,
            text: "Email",
            formater: [
              FilteringTextInputFormatter.deny(
                RegExp('[<>]'),
              ),
            ]),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        NewFormTextField(
            textInputAction: TextInputAction.next,
            focus: phoneFocus,
            controller: phone,
            keyboardType: TextInputType.phone,
            icon: Icons.phone_rounded,
            text: "Telefone",
            formater: [
              FilteringTextInputFormatter.deny(
                RegExp('[<>]'),
              ),
              MaskedInputFormatter("000 000 000"),
            ]),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        NewFormTextField(
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                onPressed();
              }
            },
            isPass: true,
            controller: password,
            focus: passFocus,
            keyboardType: TextInputType.text,
            icon: Icons.lock_rounded,
            text: "Senha",
            formater: [
              FilteringTextInputFormatter.deny(
                RegExp('[<>]'),
              ),
            ]),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        Contracts(
          backgroundColor: Colors.transparent,
          terms: () => terms(),
          privacy: () => privacy(),
        ),
        BusyBtn(
          busy: isBusy,
          tap: () => onPressed(),
          txtColor: kcWhite,
          btnColor: Colors.black,
          text: "Registar",
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        BusyBtn(
          busy: isBusy,
          tap: () => facebook(),
          txtColor: kcWhite,
          btnColor: kcFacebook,
          text: "Continua com Facebook",
        ),
        if(Platform.isIOS)...[
          SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
          BusyBtn(
          busy: isBusy,
          tap: () => onPressed(),
          txtColor: kcWhite,
          btnColor: Colors.black,
          text: "Continua com apple",
        ),
        ]
        
      ],
    );
  }
}

class _LoginWidget extends StatelessWidget {
  const _LoginWidget(
      {Key? key,
      required this.onForgot,
      required this.onPressed,
      required this.facebook,
      required this.isBusy,
      required this.email,
      required this.emailFocus,
      required this.passFocus,
      required this.password})
      : super(key: key);
  final Function onForgot;
  final TextEditingController email, password;
  final FocusNode emailFocus, passFocus;
  final Function onPressed, facebook;
  final bool isBusy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewFormTextField(
            textInputAction: TextInputAction.next,
            controller: email,
            focus: emailFocus,
            keyboardType: TextInputType.emailAddress,
            icon: Icons.email_rounded,
            text: "Email",
            formater: [
              FilteringTextInputFormatter.deny(
                RegExp('[<>]'),
              ),
            ]),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
        NewFormTextField(
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                onPressed();
              }
            },
            isPass: true,
            controller: password,
            focus: passFocus,
            keyboardType: TextInputType.text,
            icon: Icons.lock_rounded,
            text: "Senha",
            formater: [
              FilteringTextInputFormatter.deny(
                RegExp('[<>]'),
              ),
            ]),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.05),
        ),
        AutoSizeText.rich(
          TextSpan(
            style: ktsSmallBodyText,
            children: <TextSpan>[
              TextSpan(
                  text: 'Esqueceu a Senha?',
                  style: ktsLargeBodyText.copyWith(
                      fontWeight: FontWeight.w500,
                      color: kcPrimary,
                      decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = () => onForgot()),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.05),
        ),
        BusyBtn(
          busy: isBusy,
          tap: () => onPressed(),
          txtColor: kcWhite,
          btnColor: Colors.black,
          text: "Log in",
        ),
        SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
         BusyBtn(
          busy: isBusy,
          tap: () => facebook(),
          txtColor: kcWhite,
          btnColor: kcFacebook,
          text: "Continua com Facebook",
        ),
        if(Platform.isIOS)...[
          SizedBox(
          height: screenWidthPercentage(context, percentage: 0.04),
        ),
          BusyBtn(
          busy: isBusy,
          tap: () => onPressed(),
          txtColor: kcWhite,
          btnColor: Colors.black,
          text: "Continua com apple",
        ),
        ],
      ],
    );
  }
}
