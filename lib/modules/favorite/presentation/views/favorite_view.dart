import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';

import 'favorite_view_model.dart';

class FavoriteView extends StatelessWidget {
 const FavoriteView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<FavoriteViewModel>.nonReactive(
     builder: (context, model, child) {
        return   Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  screenHeightPercentage(context, percentage: 0.07)),
              child: AppBar(
                elevation: 0,
                automaticallyImplyLeading: false,
                backgroundColor: kcWhite,
                centerTitle: true,
                title: AutoSizeText(
                  "Favoritos",
                  style: ktsMediumBodyText.copyWith(color: Colors.black),
                ),
              ),
            ),
          body: const Center(child: Text("favorite"),),
        );
        },
     viewModelBuilder: () => FavoriteViewModel(),
   );
 }
}