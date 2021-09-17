import 'package:stacked/stacked_annotations.dart';
import 'package:wambo/features/startup/presentation/view/authentication/authentication_view.dart';

@StackedApp(routes: [
  StackedRoute(page: AuthenticationView, initial: true),
], logger: StackedLogger())
class AppSetup {}
