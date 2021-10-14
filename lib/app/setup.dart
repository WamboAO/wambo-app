import 'package:stacked/stacked_annotations.dart';
import 'package:wambo/modules/authentication/presentation/view/main_authentication_view.dart';
import 'package:wambo/modules/main/presentation/view/main_view.dart';

@StackedApp(routes: [
  StackedRoute(page: MainView),
  StackedRoute(page: MainAuthenticationView)
], logger: StackedLogger())
class AppSetup {}
