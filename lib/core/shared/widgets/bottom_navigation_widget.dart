import 'package:flutter/material.dart';
import 'package:wambo/core/shared/widgets/new_bottom_app_bar_widget.dart';
import 'package:wambo/app/setup.router.dart';
enum NavChoice { home, notify, favorite, account }

extension NavChoiceExtension on NavChoice {
  FABBottomAppBarItem navChoiceItem() {
    FABBottomAppBarItem item;

    switch (this) {
      case NavChoice.home:
        item = FABBottomAppBarItem(
          icon: Icons.home_rounded,
          label: "",
          tooltip: Tooltip(message: navTitle()),
        );
        break;
      case NavChoice.favorite:
        item = FABBottomAppBarItem(
          icon: Icons.favorite_rounded,
          label: "",
          tooltip: Tooltip(message: navTitle()),
        );

        break;
      case NavChoice.notify:
        item = FABBottomAppBarItem(
          icon: Icons.notifications_rounded,
          label: "",
          tooltip: Tooltip(message: navTitle()),
        );
        break;
      case NavChoice.account:
        item = FABBottomAppBarItem(
          icon: Icons.person_rounded,
          label: "",
          tooltip: Tooltip(message: navTitle()),
        );
        break;
    }
    return item;
  }

  String navTitle() {
    String selectedText;

    switch (this) {
      case NavChoice.home:
        selectedText = 'home';
        break;
      case NavChoice.favorite:
        selectedText = 'favorite';
        break;
      case NavChoice.notify:
        selectedText = 'notify';
        break;
      case NavChoice.account:
        selectedText = 'account';
        break;
    }

    return selectedText;
  }

  String initialPageRoute() {
    String selectedText;

    switch (this) {
      case NavChoice.home:
        selectedText = MainViewRoutes.storeNavigator;
        break;
      case NavChoice.favorite:
        selectedText = MainViewRoutes.favoriteNavigator;
        break;
      case NavChoice.notify:
        selectedText = MainViewRoutes.notifyNavigator;
        break;
      case NavChoice.account:
        selectedText = MainViewRoutes.accountNavigator;
        break;
    }

    return selectedText;
  }

  int nestedKeyValue() {
    int value;

    switch (this) {
      case NavChoice.home:
        value = 0;
        break;
      case NavChoice.favorite:
        value = 1;
        break;
      case NavChoice.notify:
        value = 2;
        break;
      case NavChoice.account:
        value = 3;
        break;
    }

    return value;
  }

  PageStorageKey? pageStorageKey() {
    return _pageStorageKeys[this];
  }

  static final Map<NavChoice, PageStorageKey> _pageStorageKeys = {
    NavChoice.home: PageStorageKey(NavChoice.home.navTitle()),
    NavChoice.favorite: PageStorageKey(NavChoice.favorite.navTitle()),
    NavChoice.notify: PageStorageKey(NavChoice.notify.navTitle()),
    NavChoice.account: PageStorageKey(NavChoice.account.navTitle()),
  };
}
