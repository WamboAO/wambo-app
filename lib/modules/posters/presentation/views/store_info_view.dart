import 'package:dots_indicator/dots_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/posters/domain/entities/store_info_entity.dart';
import 'package:wambo/modules/posters/presentation/views/store_info_view_model.dart';

class StoreInfoView extends StatelessWidget {
  const StoreInfoView({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreInfoViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
            child: !model.dataReady || model.isLoading
                ? const _IsLoading()
                : model.isError
                    ? _IsError(error: model.data!.message!)
                    :  _IsCompleted(choice: choice));
      },
      viewModelBuilder: () => StoreInfoViewModel(),
    );
  }
}

class _IsError extends ViewModelWidget<StoreInfoViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, StoreInfoViewModel model) {
    return const SizedBox();
  }
}

class _IsLoading extends ViewModelWidget<StoreInfoViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, StoreInfoViewModel model) {
    return Container(
      color: kcWhite,
      height: screenHeightPercentage(context, percentage: 0.2),
      padding: const EdgeInsets.all(15),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade100,
        highlightColor: Colors.grey.shade200,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey.shade100,
          ),
        ),
      ),
    );
  }
}

class _IsCompleted extends ViewModelWidget<StoreInfoViewModel> {
  const _IsCompleted({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;
  @override
  Widget build(BuildContext context, StoreInfoViewModel model) {
    return Container(
      color: kcWhite,
      height: screenHeightPercentage(context, percentage: 0.2),
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          CarouselSlider.builder(
            options: CarouselOptions(
              height: screenHeightPercentage(context, percentage: 0.2),
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) => model.setIndex(index),
              scrollDirection: Axis.horizontal,
            ),
            itemCount: model.store!.data.length,
            itemBuilder: (context, index, pageViewIndex) {
              StoreInfoDataEntity info = model.store!.data[index];
              return CachedNetworkImage(
                imageUrl: info.image,
                imageBuilder: (context, url) => GestureDetector(
                  onTap: () =>
                      model.goToSearch(category: info.tag, choice: choice),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(fit: BoxFit.cover, image: url),
                    ),
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
                  child: const Center(
                    child: Icon(
                      Icons.broken_image,
                      color: kcPrimary,
                    ),
                  ),
                ),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
                decorator: DotsDecorator(
                  activeColor: kcSecondary,
                  color: Colors.black38,
                  size: const Size(12.0, 6.0),
                  activeSize: const Size(12.0, 6.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0)),
                ),
                dotsCount: model.store!.data.length,
                position: double.parse(model.currentIndex.toString())),
          )
        ],
      ),
    );
  }
}
