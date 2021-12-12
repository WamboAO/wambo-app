import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'favorite_view_model.dart';

class FavoriteView extends StatelessWidget {
 const FavoriteView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<FavoriteViewModel>.nonReactive(
     builder: (context, model, child) {
        return  const Scaffold(
          body: Center(child: Text("favorite"),),
        );
        },
     viewModelBuilder: () => FavoriteViewModel(),
   );
 }
}