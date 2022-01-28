import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/search/domain/entities/search_items_entity.dart';
import 'package:wambo/modules/search/presentation/widgets/reactive/search_items_view_model.dart';

class SearchItemsView extends StatelessWidget {
  const SearchItemsView({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchItemsViewModel>.reactive(
      builder: (context, model, child) {
        return Container(
            child: !model.dataReady || model.isLoading
                ? const _IsLoading()
                : model.isError
                    ? _IsError(error: model.data!.message!)
                    :  _IsCompleted(choice: choice,));
      },
      viewModelBuilder: () => SearchItemsViewModel(),
    );
  }
}

class _IsError extends ViewModelWidget<SearchItemsViewModel> {
  const _IsError({Key? key, required this.error}) : super(key: key);
  final String error;

  @override
  Widget build(BuildContext context, SearchItemsViewModel model) {
    return Center(
      child: AutoSizeText(error),
    );
  }
}

class _IsLoading extends ViewModelWidget<SearchItemsViewModel> {
  const _IsLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, SearchItemsViewModel model) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
          valueColor: AlwaysStoppedAnimation<Color>(kcSecondary)),
    );
  }
}

class _IsCompleted extends ViewModelWidget<SearchItemsViewModel> {
  const _IsCompleted({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context, SearchItemsViewModel model) {
    return Container(
      color: kcWhite,
      padding: const EdgeInsets.only(left: 5, bottom: 10),
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: model.items!.data.length,
          itemBuilder: (context, index) {
            SearchItemsDataEntity item = model.items!.data[index];
            return Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: index == model.items!.data.length - 1
                      ? null
                      : const Border(
                          bottom: BorderSide(width: 0.5, color: Colors.black12),
                        )),
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () =>
                        model.goToProducts(text: item.name, choice: choice),
                    child: Container(
                      height:
                          screenHeightPercentage(context, percentage: 0.065),
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              const Icon(Icons.search, size: 13),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child:
                                    Text(item.name, style: ktsMediumBodyText),
                              ),
                            ],
                          ),
                          const Icon(
                            Icons.arrow_right,
                            size: 12,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
