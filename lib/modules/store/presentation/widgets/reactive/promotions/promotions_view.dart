import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/product_block.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/product_card.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/promotions/promotions_view_model.dart';

class PromotionView extends StatelessWidget {
  const PromotionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PromotionsViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
            child: !model.dataReady || model.isLoading
                ? const _IsLoading()
                : model.isError
                    ? _IsError(error: model.data!.message!)
                    : const _IsCompleted());
      },
      viewModelBuilder: () => PromotionsViewModel(),
    );
  }
}

class _IsError extends ViewModelWidget<PromotionsViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, PromotionsViewModel model) {
    return const SizedBox();
  }
}

class _IsLoading extends ViewModelWidget<PromotionsViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PromotionsViewModel model) {
    return Container(
      color: kcWhite,
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 3),
          itemCount: 3,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
           

            return const ProductsCardLoading();
          }),
    );
  }
}

class _IsCompleted extends ViewModelWidget<PromotionsViewModel> {
  const _IsCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PromotionsViewModel model) {
    return ProductBlock(
      title: "promoções",
      isPromo: true,
      onTap: () => print(""),
      child: Container(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 5, crossAxisSpacing: 5, crossAxisCount: 3),
            itemCount: model.promo!.data!.length,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              ProductDataEntity product = model.promo!.data![index];

              return ProductCard(
                product: product,
              );
            }),
      ),
    );
  }
}
