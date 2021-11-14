import 'package:stacked/stacked_annotations.dart';
import 'package:wambo/modules/account/presentation/views/account_view.dart';
import 'package:wambo/modules/authentication/presentation/view/main_authentication_view.dart';
import 'package:wambo/modules/cart/presentation/views/cart_view.dart';
import 'package:wambo/modules/main/presentation/view/main_view.dart';
import 'package:wambo/modules/main/presentation/widgets/navigator.dart';
import 'package:wambo/modules/notification/presentation/views/notification_view.dart';
import 'package:wambo/modules/store/presentation/views/store_view.dart';

@StackedApp(routes: [
  
  StackedRoute(page: MainAuthenticationView),
  StackedRoute(page: MainView, children: [
    StackedRoute(page: StoreNavigator, children: [
      StackedRoute(page: StoreView, initial: true)
    ]),
    StackedRoute(page: CartNavigator, children: [
       StackedRoute(page: CartView, initial: true)
    ]),
    StackedRoute(page: NotifyNavigator, children: [
       StackedRoute(page: NotificationView, initial: true)
    ]),
    StackedRoute(page: AccountNavigator, children: [
       StackedRoute(page: AccountView, initial: true)
    ]),
  ]),
], logger: StackedLogger())
class AppSetup {}
