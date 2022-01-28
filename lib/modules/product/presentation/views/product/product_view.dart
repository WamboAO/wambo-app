import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/product/presentation/views/product/product_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.id, required this.choice}) : super(key: key);
  final int id;
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
      builder: (context, model, child) {
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: kcWhite,
            elevation: 0,
            iconTheme: const IconThemeData(color: kcIconDark,  size: 28),
            actions: [
              IconButton(onPressed: ()=> print(""), icon:const Icon(
             Icons.shopping_bag_rounded,
             size: 28
              
            )),

             IconButton(onPressed: ()=> print(""), icon:const Icon(
             Icons.ios_share,
              size: 28
            )),
            IconButton(onPressed: ()=> print(""), icon:const Icon(
             Icons.more_vert,
             size: 28
              
            )),
            ],
          ),
          body: model.isLoading? const Center(child: CircularProgressIndicator()) : model.isComplete? Container(color: Colors.blue,) : model.isError? Container(color: Colors.red,): Container(),
        );
      },
      viewModelBuilder: () => ProductViewModel(id),
    );
  }
}
