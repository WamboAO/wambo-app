import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/modules/store/presentation/views/store_view_model.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/app_bar_view.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/categories_view.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/store_info_view.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ViewModelBuilder<StoreViewModel>.reactive(
      onModelReady: (model)=> model.int(),
      builder: (context, model, child) {
       
        return Scaffold(
                  backgroundColor: const Color(0xFFF1F1F1),

          appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  screenHeightPercentage(context, percentage: 0.09)),
              child:   AppbarView(
                search: ()=> model.goToSearch(),
                qrcode: ()=> model.goToQRcode(),
                cart: ()=> model.goToCart(),
             
              )),
          body:  SingleChildScrollView(
            child: Column(
              children: [
               const CategoriesView(),
               const StoreInfoView()
              
              ]
            ),
          )
        );
      },
      viewModelBuilder: () => StoreViewModel(),
    );
  }
}
