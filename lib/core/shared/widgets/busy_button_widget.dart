import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class BusyBtn extends StatelessWidget {
   const BusyBtn({
    Key? key,
    required this.tap,
    this.busy = false,
    required this.txtColor,
    this.text,
    this.icon,
    required this.btnColor,
  }) : super(key: key);

  final Function tap;
  final String? text;
  final Icon? icon;
  final bool busy;
  final Color btnColor;
  final Color txtColor;
 

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        primary: btnColor,
        elevation: 4,
      ),
      onPressed: busy == true ? null : () => tap(),
      child: !busy
          ? Padding(
              padding: const EdgeInsets.symmetric(vertical: 13, horizontal:6),
              child: icon != null
                  ? Center(child: icon!)
                  : Center(
                      child: AutoSizeText(
                        text!,
                        style: ktsLargeBodyText.copyWith(color: txtColor),
                      ),
                    ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 21,
                  width: 21,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(txtColor),
                  ),
                ),
              ),
            ),
    );
  }
}