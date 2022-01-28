import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:wambo/app/locator.dart';
import 'package:wambo/app/setup.router.dart';
import 'package:wambo/core/shared/widgets/bottom_navigation_widget.dart';
import 'package:wambo/modules/startup/presentation/view/startup_view_model.dart';

class StoreNavigator extends StatelessWidget {
  const StoreNavigator({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ExtendedNavigator(
      observers: [
        locator<StartupViewModel>().analyticsObs
      ],
      router: StoreNavigatorRouter(),
      navigatorKey: StackedService.nestedNavigationKey(
          choice.nestedKeyValue()),
    );
  }
}

class FavoriteNavigator extends StatelessWidget {
  const FavoriteNavigator({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ExtendedNavigator(
      observers: [
        locator<StartupViewModel>().analyticsObs
      ],
      router: FavoriteNavigatorRouter(),
      navigatorKey:StackedService.nestedNavigationKey(
          choice.nestedKeyValue()),
    );
  }
}

class NotifyNavigator extends StatelessWidget {
  const NotifyNavigator({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ExtendedNavigator(
      observers: [
        locator<StartupViewModel>().analyticsObs
      ],
      router: NotifyNavigatorRouter(),
      navigatorKey: StackedService.nestedNavigationKey(
          choice.nestedKeyValue()),
    );
  }
}

class AccountNavigator extends StatelessWidget {
  const AccountNavigator({Key? key, required this.choice}) : super(key: key);
  final NavChoice choice;

  @override
  Widget build(BuildContext context) {
    return ExtendedNavigator(
      observers: [
        locator<StartupViewModel>().analyticsObs
      ],
      router: AccountNavigatorRouter(),
      navigatorKey: StackedService.nestedNavigationKey(
          choice.nestedKeyValue()),
    );
  }
}
