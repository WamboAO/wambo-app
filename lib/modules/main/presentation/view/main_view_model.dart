import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/core/shared/widgets/new_bottom_app_bar_widget.dart';

class MainViewModel extends IndexTrackingViewModel  {
  MainViewModel() {
    log.d('created');
  }
  final log = getLogger('MainViewModel');
  

 List<FABBottomAppBarItem> get availableItems =>
      availableChoices.map((elem) => elem.navChoiceItem()).toList();

  List<NavChoice> get availableChoices => [
        NavChoice.home,
        NavChoice.cart,
        NavChoice.notify,
        NavChoice.account,
      ];

  GlobalKey<NavigatorState>? get currentNestedKey =>
      StackedService.nestedNavigationKey(
          availableChoices[currentIndex].nestedKeyValue());

  NavChoice get currentChoice => availableChoices[currentIndex];

}
