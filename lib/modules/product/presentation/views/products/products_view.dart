import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/modules/product/presentation/views/products/products_view_model.dart';
import 'package:wambo/modules/product/presentation/views/recent/recent_view.dart';
import 'package:wambo/modules/product/presentation/widgets/product_card.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({Key? key, required this.search, required this.choice})
      : super(key: key);
  final String search;
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductsViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(
                screenHeightPercentage(context, percentage: 0.07)),
            child: AppBar(
              elevation: 0,
              //  automaticallyImplyLeading: false,
              leading: GestureDetector(
                onTap: () => model.goBack(choice),
                child: const Icon(
                  Icons.arrow_back,
                  color: kcIconDark,
                ),
              ),
              backgroundColor: kcWhite,
              centerTitle: true,
              title: Container(
                child: AutoSizeText(
                  search,
                  style: ktsMediumBodyText.copyWith(color: Colors.black),
                ),
              ),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.filter_list_rounded,
                      color: kcIconDark,
                    ))
              ],
            ),
          ),
          body: Container(
              child: !model.dataReady || model.isLoading
                  ? const _IsLoading()
                  : model.isError
                      ? _IsError(error: model.data!.message!)
                      : _IsCompleted(choice: choice)),
        );
      },
      viewModelBuilder: () => ProductsViewModel(),
    );
  }
}

class _IsError extends ViewModelWidget<ProductsViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, ProductsViewModel model) {
    return const SizedBox();
  }
}

class _IsLoading extends ViewModelWidget<ProductsViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ProductsViewModel model) {
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

class _IsCompleted extends ViewModelWidget<ProductsViewModel> {
  const _IsCompleted({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context, ProductsViewModel model) {
    return Container(
        margin: const EdgeInsets.all(15),
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: model.product!.data.length,
            
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              ProductDataEntity product = model.product!.data[index];

              return ProductCardAlternative(
                  navigate: () => model.goToProduct(
                      index: index, product: product, choice: choice),
                  product: product);
            }));
  }
}
