import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:markdown/markdown.dart' as md;
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/core/shared/widgets/busy_button_widget.dart';

import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/modules/product/presentation/views/product/product_view_model.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.id, required this.choice}) : super(key: key);
  final int id;
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: kcWhite,
            elevation: 0,
            iconTheme: const IconThemeData(color: kcIconDark, size: 28),
            actions: [
              IconButton(
                  onPressed: () => print(""),
                  icon: const Icon(Icons.shopping_bag_rounded, size: 28)),
              IconButton(
                  onPressed: () => print(""),
                  icon: const Icon(Icons.ios_share, size: 28)),
              IconButton(
                  onPressed: () => print(""),
                  icon: const Icon(
                    FontAwesomeIcons.telegram,
                    size: 28,
                    color: Color(0xff229ED9),
                  )),
            ],
          ),
          body: Container(
              child: !model.dataReady || model.isLoading
                  ? const _IsLoading()
                  : model.isError
                      ? _IsError(error: model.data!.message!)
                      : _IsCompleted(
                          product: model.product!.data!,
                        )),
          // bottomNavigationBar: BottomAppBar(
          //   elevation: 2,
          //   child: Container(
          //     color: kcPrimary,
          //     padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 8),
          //     height: screenHeightPercentage(context, percentage: 0.1),
          //     child: Container(
          //       decoration:  BoxDecoration(
          //         color: kcWhite,
          //         borderRadius: BorderRadius.circular(4)
          //       ),
          //       child: const Center(child:  AutoSizeText("Add to cart")),
          //     ),
          //   ),
          // ),
        );
      },
      viewModelBuilder: () => ProductViewModel(id),
    );
  }
}

class _IsError extends ViewModelWidget<ProductViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, ProductViewModel model) {
    return const SizedBox();
  }
}

class _IsLoading extends ViewModelWidget<ProductViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ProductViewModel model) {
    return Container();
  }
}

class _IsCompleted extends ViewModelWidget<ProductViewModel> {
  const _IsCompleted({Key? key, required this.product}) : super(key: key);
  final ProductDataEntity product;

  @override
  Widget build(BuildContext context, ProductViewModel model) {
    int currentIndex = model.currentIndex + 1;
    return Container(
      color: kcWhite,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImage(
              product: product,
              currentIndex: currentIndex,
              setIndex: (index) => model.setIndex(index),
            ),
            ProductOverview(
                product: product,
                searchCategory: (text) => model.goToSearch(category: text)),

            // Container(
            //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Row(
            //         children: [
            //           const Icon(Icons.check_circle_outline_rounded),
            //           const SizedBox(width: 5),
            //           const AutoSizeText("free shipping"),
            //         ],
            //       ),
            //       Row(
            //         children: [
            //           const Icon(Icons.check_circle_outline_rounded),
            //           const SizedBox(width: 5),
            //           const AutoSizeText("Money back guarante"),
            //         ],
            //       ),
            //       AutoSizeText(
            //         "descrição".toUpperCase(),
            //         style:
            //             ktsMediumBodyText.copyWith(fontWeight: FontWeight.w600),
            //       ),
            //       const SizedBox(height: 8),
            //       LinkifyText(product.description,
            //           textStyle: ktsSmallBodyText,
            //           linkStyle: ktsSmallBodyText.copyWith(color: Colors.blue),
            //           onTap: (link) {
            //         if (link.value != null) {
            //           model.url(link.value!);
            //         }
            //       }),
            //       ProductData(
            //           data: product.details!.shippingTax.toString() +
            //               product.currency,
            //           title: "Taxa de Entrega")
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class ProductOverview extends StatelessWidget {
  const ProductOverview(
      {Key? key, required this.product, required this.searchCategory})
      : super(key: key);

  final ProductDataEntity product;
  final Function(String) searchCategory;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      product.name,
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                      style: ktsLargeBodyText.copyWith(
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    // AutoSizeText(
                    //   product.tldr
                    //   ,
                    //   maxLines: 2,
                    //   overflow: TextOverflow.fade,
                    //   style: ktsMediumBodyText,
                    // ),
                    AutoSizeText(
                      product.price.toString() + " ${product.currency}",
                      style: ktsLargeBodyText,
                    ),
                  ],
                ),
              ),
              Flexible(
                  child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.bookmark,
                        size: 35,
                        color: kcIcon,
                      )))
            ],
          ),
          Container(
            color: kcWhite,
            margin: const EdgeInsets.only(top: 8),
            height: screenHeightPercentage(context, percentage: 0.058),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: product.details!.categories.length,
                itemBuilder: (context, index) {
                  ProductCategoriesEntity category =
                      product.details!.categories[index];
                  return InkWell(
                    onTap: () => searchCategory(category.name),
                    child: Container(
                      margin:
                          const EdgeInsets.only(right: 5, top: 5, bottom: 5),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: kcIconLight,
                          borderRadius: BorderRadius.circular(4)),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.fitWidth,
                          child: AutoSizeText(
                            category.name.toUpperCase(),
                            style: ktsSmallBodyText.copyWith(color: kcIconDark),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
            child: BusyBtn(
              tap: () {},
              txtColor: kcWhite,
              btnColor: kcSecondary,
              text: "adicionar ao carrinho",
            ),
          )
        ],
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.product,
    required this.currentIndex,
    required this.setIndex,
  }) : super(key: key);

  final ProductDataEntity product;
  final Function(int) setIndex;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeightPercentage(context, percentage: 0.43),
      child: Stack(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: screenHeightPercentage(context, percentage: 0.43),
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: false,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) => setIndex(index),
              scrollDirection: Axis.horizontal,
            ),
            itemCount: product.details!.images.length,
            itemBuilder: (context, index, pageViewIndex) {
              ProductImagesEntity image = product.details!.images[index];
              return CachedNetworkImage(
                imageUrl: image.src,
                imageBuilder: (context, url) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover, image: url),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade100,
                  highlightColor: Colors.grey.shade200,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: kcIconLight,
                  child: const Center(
                    child: Icon(
                      Icons.broken_image,
                      size: 40,
                      color: kcIconDark,
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: kcIconDark.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(10)),
              child: AutoSizeText(
                "$currentIndex/${product.details!.images.length}",
                style: ktsSmallBodyText.copyWith(color: kcWhite),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ProductData extends StatelessWidget {
  const ProductData(
      {Key? key,
      required this.data,
      required this.title,
      this.isBottom = false})
      : super(key: key);

  final String data;
  final String title;
  final bool isBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: const BorderSide(color: kcIconLight, width: 0.2),
              bottom: BorderSide(
                  color: isBottom == false ? kcPrimary : kcIconLight,
                  width: 0.2))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AutoSizeText(
              title,
              style: ktsSmallBodyText.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          AutoSizeText(
            data,
            style: ktsSmallBodyText,
          )
        ],
      ),
    );
  }
}
