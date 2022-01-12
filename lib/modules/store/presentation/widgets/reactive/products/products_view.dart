import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/money_input_enums.dart';
import 'package:flutter_multi_formatter/formatters/money_input_formatter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/product_block.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/product_card.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/products/products_view_model.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductsViewModel>.reactive(
      builder: (context, model, child) {
        return model.isComplete && model.product!.data!.isNotEmpty
            ? ProductBlock(
                title: "Todos",
                onTap: () => print(""),
                child: Container(
                    margin: const EdgeInsets.all(15),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: model.product!.data!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          ProductDataEntity product =
                              model.product!.data![index];

                          return ProductCardAlternative(product: product);
                        })))
            : const SizedBox();
      },
      viewModelBuilder: () => ProductsViewModel(),
    );
  }
}


