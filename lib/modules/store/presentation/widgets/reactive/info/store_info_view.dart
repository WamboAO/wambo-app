import 'package:auto_size_text/auto_size_text.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/store/domain/entities/store_info_entity.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/info/store_info_view_model.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/promotions/promotions_view.dart';

class StoreInfoView extends StatelessWidget {
  const StoreInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreInfoViewModel>.reactive(
      builder: (context, model, child) {
        return model.isComplete && model.store!.data.isNotEmpty
            ? Container(
              height: screenHeightPercentage(context, percentage: 0.2),
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
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1000),
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
                          imageBuilder: (context, url) => Container(
                            decoration: BoxDecoration(
                              image:
                                  DecorationImage(fit: BoxFit.cover, image: url),
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
                          dotsCount: model.store!.data.length,
                          position: double.parse(model.currentIndex.toString())),
                    )
                  ],
                ),
            )
            : const SizedBox();
      },
      viewModelBuilder: () => StoreInfoViewModel(),
    );
  }
}




// Container(
//                 padding: const EdgeInsets.all(8),
//                 color: kcWhite,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                            AutoSizeText(
//                             "POPULAR",
//                             style: ktsMediumBodyText.copyWith(fontWeight: FontWeight.w600),
//                           ),
//                           AutoSizeText(
//                             "Ver todos",
//                             style: ktsSmallBodyText.copyWith(color: Colors.blue),
//                           )
//                         ],
//                       ),
//                     ),

//                     Container(
                     
//                       height: screenHeightPercentage(context, percentage: 0.27),
//                       child: ListView.builder(
//                           scrollDirection: Axis.horizontal,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {
//                             return AspectRatio(
//                               aspectRatio: 8 / 9,
//                               child: Container(
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 5),
//                                   child: const Placeholder()),
//                             );
//                           }),
//                     ),
//                   ],
//                 ),
 //             ),