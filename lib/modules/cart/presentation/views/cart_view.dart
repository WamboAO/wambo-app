import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/modules/cart/presentation/views/cart_view_model.dart';

class CartView extends StatelessWidget {
 const CartView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<CartViewModel>.nonReactive(
     builder: (context, model, child) {
        return  const Scaffold(
          body: Center(child: Text("cart"),),
        );
        },
     viewModelBuilder: () => CartViewModel(),
   );
 }
}