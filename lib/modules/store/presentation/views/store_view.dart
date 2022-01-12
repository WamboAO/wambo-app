import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/store/presentation/views/store_view_model.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/app_bar_view.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/forYou/foryou_view.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/info/store_info_view.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/popular/popular_view.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/products/products_view.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/promotions/promotions_view.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/recent/recent_view.dart';

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
                child: Hero(
                  tag: "appBar",
                  child: AppbarView(
                    search: () => model.goToSearch(),
                    cart: () => model.goToCart(),
                  ),
                )),
            body: SingleChildScrollView(
              child: Column(children: [
                const PromotionView(),
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
                      const PopularView(),
                      const RecentView(),
                      const ForYouView(),
                      const PopularView(),
                    ],
                  ),
                ),
                const ProductsView(),
                SizedBox(
                  height: screenHeightPercentage(context, percentage: 0.07),
                )
              ]),
            ));
      },
      viewModelBuilder: () => StoreViewModel(),
    );
  }
}
