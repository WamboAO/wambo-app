import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/text_field_widget.dart';

import 'app_bar_view_model.dart';

class AppbarView extends StatelessWidget {
  const AppbarView(
      {Key? key,
      
    
     })
      : super(key: key);
  

  

  @override
  Widget build(BuildContext context) {
    var viewModelBuilder2 = ViewModelBuilder<AppbarViewModel>.reactive(
      builder: (context, model, child) {
        return AppBar(
          elevation: 0,
          backgroundColor: kcWhite,
          
          title: Row(
            children: [
                IconButton(
               iconSize: 30,
               padding: const EdgeInsets.only(right: 15),
                splashRadius: 20,
                onPressed: ()=> model.goToSearch(), 
                icon: const Icon(Icons.qr_code_scanner_rounded, color: kcIcon,)),
              Expanded(
                child: GestureDetector(
                  onTap: ()=> model.goToSearch(),
                  child: Container(
                     height: screenHeightPercentage(context, percentage: 0.06),
                     decoration:  BoxDecoration(
                       color: kcIconLight,
                       borderRadius: BorderRadius.circular(4)

                     ),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                          Padding(
                           padding:  const EdgeInsets.symmetric(horizontal: 20.0),
                           child:  AutoSizeText("search", style: ktsSmallBodyText.copyWith(color: kcIconDark, fontSize: 14),),
                         ), 
                         Container(
                           
                           padding: const EdgeInsets.all(8),
                           decoration: const BoxDecoration(
                             color: kcPrimary,
                             borderRadius: BorderRadius.only(topRight: Radius.circular(4), bottomRight:Radius.circular(4) )
                           ),
                           child:  const Icon(Icons.search),
                         )
                       ],
                     ),
                  ),
                ),
              ),
            ],
          ),
          actions: [
             IconButton(
               iconSize: 32,
               padding: const EdgeInsets.only(right: 15),
                splashRadius: 20,
                onPressed: ()=> model.goToCart(), 
                icon: const Icon(Icons.shopping_bag_rounded, color: kcIcon,))
          ],
        );
      },
      viewModelBuilder: () => AppbarViewModel(),
    );
    return viewModelBuilder2;
  }
}
