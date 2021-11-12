import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wambo/core/shared/widgets/new_bottom_app_bar_widget.dart';
import 'package:wambo/core/utils/routes.dart';

enum NavChoice { home, notify, cart, account }

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
      case NavChoice.cart:
        item = FABBottomAppBarItem(
          icon: Icons.shopping_bag_rounded,
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
      case NavChoice.cart:
        selectedText = 'cart';
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
        selectedText = homeRoute;
        break;
      case NavChoice.cart:
        selectedText = cartRoute;
        break;
      case NavChoice.notify:
        selectedText = notifyRoute;
        break;
      case NavChoice.account:
        selectedText = accountRoute;
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
      case NavChoice.cart:
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
    NavChoice.cart: PageStorageKey(NavChoice.cart.navTitle()),
    NavChoice.notify: PageStorageKey(NavChoice.notify.navTitle()),
    NavChoice.account: PageStorageKey(NavChoice.account.navTitle()),
  };
}
