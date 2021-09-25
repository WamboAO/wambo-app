import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class TopHeaderLogin extends StatelessWidget {
   const TopHeaderLogin({
    required this.cancel,
    required this.login,
    Key? key,
  }) : super(key: key);

  final Function cancel;
  final Function login;
 

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          bottom: screenHeightPercentage(context, percentage: 0.08)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
              onPressed: () => cancel(),
              child: Text(
                "Cancelar",
                style: ktsLargeBodyText.copyWith(color: Colors.white),
              )),
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                fixedSize: Size.fromWidth(
                    screenWidthPercentage(context, percentage: 0.25)),
                side: const BorderSide(width: 1.5, color: Colors.white),
              ),
              onPressed: () => login(),
              child: Text(
                "Login",
                style: ktsLargeBodyText.copyWith(color: Colors.white),
              ))
        ],
      ),
    );
  }
}