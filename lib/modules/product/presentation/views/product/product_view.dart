import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/core/shared/widgets/busy_button_widget.dart';
import 'package:wambo/modules/product/domain/entities/products_entity.dart';
import 'package:wambo/modules/product/presentation/views/product/product_view_model.dart';
import 'package:wambo/modules/product/presentation/widgets/product_card.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key, required this.id, required this.choice})
      : super(key: key);
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
                  onPressed: () => model.goToCart(choice),
                  icon: const Icon(Icons.shopping_bag_rounded, size: 28)),
              PopupMenuButton(
                onSelected: (value) =>
                    model.setValue(value: value, choice: choice),
                icon: const Icon(
                  Icons.more_vert,
                  size: 28,
                ),
                itemBuilder: (BuildContext context) => [
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(Icons.messenger),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Mensagem",
                          style: ktsSmallBodyText.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    value: 1,
                  ),
                  PopupMenuItem(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.home,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          "Início",
                          style: ktsSmallBodyText.copyWith(fontSize: 13),
                        ),
                      ],
                    ),
                    value: 2,
                  ),
                ],
              ),
            ],
          ),
          body: Container(
              child: !model.dataReady || model.isLoading
                  ? const _IsLoading()
                  : model.isError
                      ? _IsError(error: model.data!.message!)
                      : _IsCompleted(
                        choice: choice,
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
  const _IsCompleted({Key? key, required this.product, required this.choice}) : super(key: key);
  final ProductDataEntity product;
  final NavChoice choice;

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
                busy: model.isBusy,
                product: product,
                searchLink: (link) => model.url(link),
                searchCategory: (text) =>
                    model.goToSearch(category: text, choice: choice)),
          ],
        ),
      ),
    );
  }
}

class ProductOverview extends StatelessWidget {
  const ProductOverview(
      {Key? key,
      required this.product,
      required this.searchCategory,
      required this.searchLink,
      required this.busy})
      : super(key: key);

  final ProductDataEntity product;
  final Function(String) searchCategory, searchLink;
  final bool busy;

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
                child: AutoSizeText(
                  product.name,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: ktsLargeBodyText.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              const Flexible(
                  child: SizedBox(
                width: 10,
              )),
              Expanded(flex: 3, child: ProductPrice(product: product))
            ],
          ),
          Container(
            color: kcWhite,
            margin: const EdgeInsets.only(top: 8),
            height: screenHeightPercentage(context, percentage: 0.062),
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
          SizedBox(
            height: screenHeightPercentage(context, percentage: 0.02),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 18,
                  child: BusyBtn(
                    tap: () {},
                    busy: busy,
                    txtColor: kcWhite,
                    btnColor: kcSecondary,
                    text: "Adicionar ao carrinho",
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                            color: kcIconLight,
                            borderRadius: BorderRadius.circular(4)),
                        child: const Icon(
                          Icons.bookmark_add,
                        )),
                  ),
                ),
                const Spacer(),
                Expanded(
                  flex: 4,
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 8),
                        decoration: BoxDecoration(
                            color: kcIconLight,
                            borderRadius: BorderRadius.circular(4)),
                        child: const Icon(
                          Icons.ios_share,
                        )),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: AutoSizeText(
              "descrição".toUpperCase(),
              style: ktsMediumBodyText.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          LinkifyText(
            product.description,
            textStyle: ktsSmallBodyText,
            linkStyle: ktsSmallBodyText.copyWith(color: Colors.blue),
            onTap: (link) {
              if (link.value != null) {
                searchLink(link.value!);
              }
            },
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
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
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
                GestureDetector(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        color: kcIconDark.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(
                      Icons.fit_screen,
                      color: kcWhite,
                      size: 18,
                    ),
                  ),
                ),
              ],
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
