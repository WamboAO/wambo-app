import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/product_block.dart';
import 'package:wambo/modules/store/presentation/widgets/normal/product_card.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/popular/popular_view_model.dart';

class PopularView extends StatelessWidget {
  const PopularView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PopularViewModel>.reactive(
      builder: (context, model, child) {
         return Container(
            child: !model.dataReady || model.isLoading
                ? const _IsLoading()
                : model.isError
                    ? _IsError(error: model.data!.message!)
                    : const _IsCompleted());
      },
      viewModelBuilder: () => PopularViewModel(),
    );
  }
}

class _IsError extends ViewModelWidget<PopularViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, PopularViewModel model) {
    return const SizedBox();
  }
}

class _IsLoading extends ViewModelWidget<PopularViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, PopularViewModel model) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(2, (index) {
            return const Expanded(child: ProductsCardLoading());
          })),
    );
  }
}

class _IsCompleted extends ViewModelWidget<PopularViewModel> {
  const _IsCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PopularViewModel model) {
    return ProductBlock(
        title: "popular",
        onTap: () => print(""),
        child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(model.product!.data!.length, (index) {
                ProductDataEntity product = model.product!.data![index];

                return Expanded(
                    child: ProductsCard(
                  product: product,
                ));
              })),
        ));
  }
}