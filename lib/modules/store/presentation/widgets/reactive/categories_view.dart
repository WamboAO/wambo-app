import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/store/domain/entities/categories_entity.dart';
import 'package:wambo/modules/store/presentation/widgets/reactive/categories_view_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      builder: (context, model, child) {
        return !model.dataReady || model.isLoading
            ? Container()
            : model.isError
                ? Container()
                : Container(
                  color: kcWhite,
                  margin: const EdgeInsets.only(left: 5, bottom: 10),
                    height: screenHeightPercentage(context, percentage: 0.068),
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: model.categories!.data.length,
                        itemBuilder: (context, index) {
                          CategoriesDataEntity category =
                              model.categories!.data[index];
                          return InkWell(
                            onTap: ()=> model.goToSearch(category: category.category),
                            child: Container(
                              margin: const EdgeInsets.all(6),
                              padding: const EdgeInsets.all(10),
                              decoration:   BoxDecoration(
                                color: index == 0? kcSecondary.withOpacity(0.4) : kcIconLight,
                                borderRadius: BorderRadius.circular(4)
                              ),
                              child: AutoSizeText(category.category.toUpperCase(), style: ktsMediumBodyText.copyWith(color: index == 0? kcSecondary : kcIconDark),),
                            ),
                          );
                        }),
                  );

      
      },
      viewModelBuilder: () => CategoriesViewModel(),
    );
  }
}