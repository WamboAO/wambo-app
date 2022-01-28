import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/modules/categories/domain/entities/categories_entity.dart';
import 'package:wambo/modules/categories/presentation/views/categories_view_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CategoriesViewModel>.reactive(
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) {
        return Container(
            child: !model.dataReady || model.isLoading
                ? const _IsLoading()
                : model.isError
                    ? _IsError(error: model.data!.message!)
                    : const _IsCompleted());
      },
      viewModelBuilder: () => CategoriesViewModel(),
    );
  }
}

class _IsError extends ViewModelWidget<CategoriesViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, CategoriesViewModel model) {
    return const SizedBox();
  }
}

class _IsLoading extends ViewModelWidget<CategoriesViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, CategoriesViewModel model) {
    return Container(
      color: kcWhite,
       margin: const EdgeInsets.only(left: 5, bottom: 5),
      height: screenHeightPercentage(context, percentage: 0.064),
      child: ListView.builder(
          key: const PageStorageKey('storage-key'),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) {
            return Shimmer.fromColors(
              baseColor: Colors.grey.shade100,
              highlightColor: Colors.grey.shade200,
              child: Container(
                margin: const EdgeInsets.all(6),
                padding: const EdgeInsets.all(10),
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.grey.shade100,
                ),
              ),
            );
          }),
    );
  }
}

class _IsCompleted extends ViewModelWidget<CategoriesViewModel> {
  const _IsCompleted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, CategoriesViewModel model) {
    return Container(
      color: kcWhite,
      margin: const EdgeInsets.only(left: 5, bottom: 5),
      height: screenHeightPercentage(context, percentage: 0.064),
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: model.categories!.data.length,
          itemBuilder: (context, index) {
            CategoriesDataEntity category = model.categories!.data[index];
            return InkWell(
              onTap: () => model.goToSearch(category: category.category),
              child: Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color:
                        index == 0 ? kcSecondary.withOpacity(0.4) : kcIconLight,
                    borderRadius: BorderRadius.circular(4)),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.fitWidth,
                    child: AutoSizeText(
                      category.category.toUpperCase(),
                      style: ktsSmallBodyText.copyWith(
                          color: index == 0 ? kcSecondary : kcIconDark),
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
