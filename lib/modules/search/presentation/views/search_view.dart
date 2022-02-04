import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/search/presentation/views/search_view_model.dart';
import 'package:wambo/modules/search/presentation/widgets/normal/app_bar_widget.dart';
import 'package:wambo/modules/search/presentation/widgets/reactive/search_items_view.dart';

class SearchView extends HookWidget {
  const SearchView({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    var search = useTextEditingController();
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
            backgroundColor: kcIconLight,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                    screenHeightPercentage(context, percentage: 0.1)),
                child: SearchBar(
                    controller: search,
                    back: () => model.goToHome(choice),
                    search: (text) => model.search(text),
                    navigation:  () => search.text.isEmpty? null :
                        model.goToProducts(text: search.text, choice: choice))),
            body: SearchItemsView(
              choice: choice,
            ));
      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}
