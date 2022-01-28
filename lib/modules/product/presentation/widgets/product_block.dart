import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:wambo/core/shared/ui/styles.dart';

class ProductBlock extends StatelessWidget {
  const ProductBlock({Key? key, required this.title, this.isPromo = false, required this.onTap, required this.child}) : super(key: key);
  final Widget child;
  final String title;
  final bool isPromo;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kcWhite,
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => onTap(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    title.toUpperCase(),
                    style:
                        ktsMediumBodyText.copyWith(fontWeight: FontWeight.w600),
                  ),
                  if(isPromo == true) ...[
                    AutoSizeText(
                    "Ver todos",
                    style: ktsSmallBodyText.copyWith(color: Colors.blue),
                  )
                  ],
                  if(isPromo == false)...[
                    const SizedBox(),
                  ]
                  
                ],
              ),
            ),
          ),
          child
        ],
      ),
    );
  }
}
