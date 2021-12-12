import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/modules/store/presentation/views/store_view_model.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/app_bar_view.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return ViewModelBuilder<StoreViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: const Color(0xFFF1F1F1),
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(
                  screenHeightPercentage(context, percentage: 0.09)),
              child: const AppbarView()),
          body: Column(
            children: [
              if (!model.dataReady || model.isLoading) ...[],
              
               
                if (model.isError) ...[],
                if (model.isComplete) ...[],
             
            ],
          ),
        );
      },
      viewModelBuilder: () => StoreViewModel(),
    );
  }
}
