import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/modules/product/presentation/views/recent/recent_view_model.dart';
import 'package:wambo/modules/product/presentation/widgets/product_block.dart';
import 'package:wambo/modules/product/presentation/widgets/product_card.dart';

class RecentView extends StatelessWidget {
  const RecentView({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RecentViewModel>.reactive(
      builder: (context, model, child) {
        return model.isComplete && model.product!.data.isNotEmpty
            ? ProductBlock(
                title: "recente",
                onTap: () => model.goToSearch(category: "Recente", choice: choice ),
                child: Container(
                    margin: const EdgeInsets.all(15),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: model.product!.data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          ProductDataEntity product =
                              model.product!.data[index];

                          return ProductCardAlternative(
                              navigate: () => model.goToProduct(
                                  index: index,
                                  product: product,
                                  choice: choice),
                              product: product);
                        })))
            : const SizedBox();
      },
      viewModelBuilder: () => RecentViewModel(),
    );
  }
}
