import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/product/presentation/views/forYou/foryou_view.dart';
import 'package:wambo/modules/product/presentation/views/popular/popular_view.dart';
import 'package:wambo/modules/product/presentation/views/products/products_view.dart';
import 'package:wambo/modules/product/presentation/views/promotions/promotions_view.dart';
import 'package:wambo/modules/product/presentation/views/recent/recent_view.dart';
import 'package:wambo/modules/product/presentation/views/suggestions/suggestions_view.dart';
import 'package:wambo/modules/store/presentation/views/store_view_model.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/app_bar_view.dart';
import 'package:wambo/modules/posters/presentation/views/store_info_view.dart';

class StoreView extends StatelessWidget {
  const StoreView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreViewModel>.nonReactive(
      onModelReady: (model) => model.int(),
      fireOnModelReadyOnce: true,
      disposeViewModel: false,
      builder: (context, model, child) {
        return Scaffold(
            backgroundColor: kcIconLight,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                    screenHeightPercentage(context, percentage: 0.16)),
                child: AppbarView(
                  search: () => model.goToSearch(model.choice),
                  cart: () => model.goToCart(),
                )),
            body: RefreshIndicator(
              onRefresh: () {
                var completer = Completer();

                Timer(const Duration(seconds: 3), () {
                  model.int();
                  completer.complete();
                });
                return completer.future;
              },
              child: SingleChildScrollView(
                child: Column(children: [
                  PromotionView(choice: model.choice),
                  const StoreInfoView(),
                  Container(
                    color: kcWhite,
                    child: GridView.count(
                      padding: const EdgeInsets.all(5),
                      shrinkWrap: true,
                      childAspectRatio: 1.35,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      children: [
                        PopularView(choice: model.choice),
                        RecentView(choice: model.choice),
                        SuggestionsView(choice: model.choice),
                        ForYouView(choice: model.choice),
                      ],
                    ),
                  ),
                  ProductsView(choice: model.choice),
                ]),
              ),
            ));
      },
      viewModelBuilder: () => StoreViewModel(),
    );
  }
}
