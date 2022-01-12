import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/search/presentation/search_view_model.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchViewModel>.reactive(
      builder: (context, model, child) {
        return  Scaffold(
          appBar: PreferredSize(
                preferredSize: Size.fromHeight(
                    screenHeightPercentage(context, percentage: 0.1)),
                child: Hero(
                  tag: "appBar",
                  child: AppBar(),
                )),
        );
      },
      viewModelBuilder: () => SearchViewModel(),
    );
  }
}
