import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/entities/products_entity.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/promotions/promotions_view_model.dart';

class PromotionView extends StatelessWidget {
  const PromotionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PromotionsViewModel>.reactive(
      builder: (context, model, child) {
        return model.isComplete && model.promo!.data!.isNotEmpty
            ? Container(
                color: kcWhite,
                padding: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "promoções".toUpperCase(),
                            style: ktsMediumBodyText.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          AutoSizeText(
                            "Ver todos",
                            style:
                                ktsSmallBodyText.copyWith(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  crossAxisCount: 3),
                          itemCount: model.promo!.data!.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            ProductDataEntity product =
                                model.promo!.data![index];
                            double discount = product.discount! * 100;
                            return Column(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: CachedNetworkImage(
                                    imageUrl: product.thumbnail,
                                    imageBuilder: (context, url) => Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(4),
                                            image: DecorationImage(
                                                fit: BoxFit.cover, image: url),
                                          ),
                                        
                                        ),
                                        Container(
                                       decoration:const BoxDecoration(
                                         borderRadius: BorderRadius.only(topLeft: Radius.circular(4), bottomRight:Radius.circular(4) ),
                                          color: kcSecondary,
                                       ),
                                        padding: const EdgeInsets.all(2),
                                        child: AutoSizeText("-$discount%", style: ktsSmallBodyText.copyWith(color: kcWhite, fontWeight: FontWeight.w600),),
                                      ),
                                      ],
                                    ),
                                    placeholder: (context, url) =>
                                        Shimmer.fromColors(
                                      baseColor: Colors.grey.shade100,
                                      highlightColor: Colors.grey.shade200,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade100,
                                        ),
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Container(
                                      child: const Center(
                                        child: Icon(
                                          Icons.broken_image,
                                          color: kcPrimary,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    margin: const EdgeInsets.only(top: 4),
                                    child: AutoSizeText(
                                        product.price.toString() + ' AOA', style: ktsSmallBodyText.copyWith(fontWeight: FontWeight.w600),),
                                  ),
                                )
                                // Container(
                                //   color: Colors.blue,
                                //   child: CachedNetworkImage(
                                //     imageUrl: product.thumbnail,
                                //     imageBuilder: (context, url) => Container(

                                //         decoration: BoxDecoration(
                                //             image: DecorationImage(
                                //                 fit: BoxFit.cover, image: url))),
                                //     placeholder: (context, url) =>
                                //         Shimmer.fromColors(
                                //       baseColor: Colors.grey.shade100,
                                //       highlightColor: Colors.grey.shade200,
                                //       child: Container(

                                //         decoration: BoxDecoration(
                                //           color: Colors.grey.shade100,
                                //         ),
                                //       ),
                                //     ),
                                //     errorWidget: (context, url, error) =>
                                //         Container(

                                //       child: const Center(
                                //         child: Icon(
                                //           Icons.broken_image,
                                //           color: kcPrimary,
                                //         ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],
                            );
                          }),
                    ),
                  ],
                ),
              )
            : const SizedBox();
      },
      viewModelBuilder: () => PromotionsViewModel(),
    );
  }
}
