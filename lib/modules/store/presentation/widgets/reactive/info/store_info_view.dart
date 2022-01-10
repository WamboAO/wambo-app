import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/info/store_info_view_model.dart';
import 'package:timer_count_down/timer_count_down.dart';

class StoreInfoView extends StatelessWidget {
  const StoreInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StoreInfoViewModel>.reactive(
      builder: (context, model, child) {
        return Column(
          children: [
            if (!model.dataReady || model.isLoading) Container(),
            if (model.isError) Container(),
            if (model.isComplete) ...[
              //TODO: add popular
              Container(
                color: kcWhite,
                padding: const EdgeInsets.all(8),
                
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              
                              AutoSizeText("promoções".toUpperCase(),
                            
                      style: ktsMediumBodyText.copyWith(fontWeight: FontWeight.w600),),
                     
                    const SizedBox(width: 8,),
                      Countdown(
                  seconds: 86400,
                  build: (BuildContext context, double time) {
                    Duration duration = Duration(seconds: time.toInt());
                    return Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: kcSecondary,
                        borderRadius: BorderRadius.circular(4)
                      ),
                      child: Row(
                        children: [
                          Icon(
                                Icons.bolt,
                                color: Colors.yellow.shade600,
                                size: 18,
                              ),
                          Text(
                            duration.format().toString(),
                            style: ktsSmallBodyText.copyWith(
                                fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  },
                  interval: const Duration(seconds: 1),
                ),
                            ],
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
                      height: screenHeightPercentage(context, percentage: 0.3),
                      padding: const EdgeInsets.all(8),
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4),
                          itemCount: 8,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 7 / 2,
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  child: const Placeholder()),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(8)),
                width: screenWidth(context),
                height: screenHeightPercentage(context, percentage: 0.23),
                child: Image.network(
                  model.store!.data.promo[0].image,
                  fit: BoxFit.cover,
                  scale: 5,
                ),
              ),
              //TODO: add deals
              Container(
                padding: const EdgeInsets.all(8),
                color: kcWhite,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           AutoSizeText(
                            "POPULAR",
                            style: ktsMediumBodyText.copyWith(fontWeight: FontWeight.w600),
                          ),
                          AutoSizeText(
                            "Ver todos",
                            style: ktsSmallBodyText.copyWith(color: Colors.blue),
                          )
                        ],
                      ),
                    ),

                    Container(
                     
                      height: screenHeightPercentage(context, percentage: 0.27),
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return AspectRatio(
                              aspectRatio: 8 / 9,
                              child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: const Placeholder()),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ]
          ],
        );
      },
      viewModelBuilder: () => StoreInfoViewModel(),
    );
  }
}

extension on Duration {
  String format() => '$this'.split('.')[0].padLeft(8, '0');
}