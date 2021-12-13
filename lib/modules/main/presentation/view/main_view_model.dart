import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.logger.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/core/shared/widgets/new_bottom_app_bar_widget.dart';
import 'package:wambo/modules/notification/presentation/services/get_notificaion_service.dart';
import 'package:wambo/modules/store/presentation/services/get_store_info_service.dart';

class MainViewModel extends IndexTrackingViewModel {
  MainViewModel() {
    log.d('created');
  }
  final log = getLogger('MainViewModel');
  final _getStoreInfoService = locator<GetStoreInfoService>();
  final _getNotificationService = locator<GetNotificationService>();

  List<FABBottomAppBarItem> get availableItems =>
      availableChoices.map((elem) => elem.navChoiceItem()).toList();

  List<NavChoice> get availableChoices => [
        NavChoice.home,
        NavChoice.favorite,
        NavChoice.notify,
        NavChoice.account,
      ];

  GlobalKey<NavigatorState>? get currentNestedKey =>
      StackedService.nestedNavigationKey(
          availableChoices[currentIndex].nestedKeyValue());

  NavChoice get currentChoice => availableChoices[currentIndex];

  Future init() async {
    await _getStoreInfoService.getStoreInfo();
    await _getNotificationService.getNotifications();
  }

  goToWhatsapp() {}
}
