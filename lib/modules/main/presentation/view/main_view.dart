import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/core/shared/ui/sizing.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/shared/widgets/new_bottom_app_bar_widget.dart';
import 'package:wambo/modules/main/presentation/view/main_view_model.dart';
import 'package:wambo/modules/main/presentation/widgets/navigator.dart';
import 'package:wambo/modules/store/presentation/views/store_view.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      disposeViewModel: false,
      onModelReady: (model) => model.init(),
      builder: (context, model, child) {
        Widget loadingIndicator = model.isBusy
            ? Container(
                color: Colors.black.withOpacity(0.6),
                width: screenWidthPercentage(context),
                height: screenHeightPercentage(context),
                child: Center(
                  child: Platform.isIOS
                      ? const CupertinoActivityIndicator(
                          radius: 10,
                        )
                      : const CircularProgressIndicator(
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                ),
              )
            : Container();
        return WillPopScope(
          onWillPop: () async => false,
          child: Scaffold(
            body: Stack(
              children: [
                IndexedStack(
                  index: model.currentIndex,
                  children: [
                    StoreNavigator(choice: model.availableChoices[0],),
                    CartNavigator(choice: model.availableChoices[1],),
                    NotifyNavigator(choice: model.availableChoices[2],),
                    AccountNavigator(choice: model.availableChoices[3],)
                  ],
                ),
                Align(
                  child: loadingIndicator,
                  alignment: FractionalOffset.center,
                ),
              ],
            ),
            bottomNavigationBar: FABBottomAppBar(
              currentIndex: model.currentIndex,
              items: model.availableItems,
              onTabSelected: model.setIndex,
              selectedColor: kcPrimary,
              iconSize: 28,
              height: screenHeightPercentage(context, percentage: 0.1),
              color: kcIconLight,
            ),
          ),
        );
      },
      viewModelBuilder: () => locator<MainViewModel>(),
    );
  }
}
