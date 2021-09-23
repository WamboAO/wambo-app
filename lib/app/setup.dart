import 'package:stacked/stacked_annotations.dart';
import 'package:wambo/features/login/presentation/view/login_view.dart';
import 'package:wambo/features/main/presentation/view/main_view.dart';

@StackedApp(routes: [
  StackedRoute(page: MainView),
  StackedRoute(page: LoginView)
], logger: StackedLogger())
class AppSetup {}
