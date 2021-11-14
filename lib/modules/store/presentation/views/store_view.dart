import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/store/presentation/views/store_view_model.dart';

class StoreView extends StatelessWidget {
 const StoreView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<StoreViewModel>.reactive(
     builder: (context, model, child) {
        return Scaffold(
          body: Column(
            children: [
              if(!model.dataReady)...[
            
              ],
              if(model.dataReady)...[
               
                if(model.data!.status == Status.loading)...[],
                if(model.data!.status == Status.completed)...[],
                if(model.data!.status == Status.error)...[],
              ]
            ],
          ),
        );
        },
     viewModelBuilder: () => StoreViewModel(),
   );
 }
}