import 'package:stacked/stacked_annotations.dart';
import 'package:wambo/features/authentication/presentation/view/authentication_view.dart';
import 'package:wambo/features/main/presentation/view/main_view.dart';

@StackedApp(routes: [
  StackedRoute(page: MainView),
  StackedRoute(page: AuthenticationView)
], logger: StackedLogger())
class AppSetup {}
