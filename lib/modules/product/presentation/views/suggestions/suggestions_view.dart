import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/modules/product/presentation/views/suggestions/suggestions_view_model.dart';
import 'package:wambo/modules/product/presentation/widgets/product_block.dart';
import 'package:wambo/modules/product/presentation/widgets/product_card.dart';

class SuggestionsView extends StatelessWidget {
  const SuggestionsView({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuggestionsViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
            child: !model.dataReady || model.isLoading
                ? const _IsLoading()
                : model.isError
                    ? _IsError(error: model.data!.message!)
                    : _IsCompleted(choice: choice));
      },
      viewModelBuilder: () => SuggestionsViewModel(),
    );
  }
}

class _IsError extends ViewModelWidget<SuggestionsViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, SuggestionsViewModel model) {
    return const SizedBox();
  }
}

class _IsLoading extends ViewModelWidget<SuggestionsViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, SuggestionsViewModel model) {
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

class _IsCompleted extends ViewModelWidget<SuggestionsViewModel> {
  const _IsCompleted({Key? key,required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context, SuggestionsViewModel model) {
    return ProductBlock(
        title: "sugestões",
                onTap: () => model.goToSearch(category: "Sugestões", choice: choice ),

        child: Container(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: List.generate(model.product!.data.length, (index) {
                ProductDataEntity product = model.product!.data[index];

                return Expanded(
                    child: ProductsCard(
                  navigate: () => model.goToProduct(index: index, product: product, choice: choice),
                  product: product,
                ));
              })),
        ));
  }
}
