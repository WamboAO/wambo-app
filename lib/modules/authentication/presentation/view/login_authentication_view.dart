import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/core/shared/ui/styles.dart';
import 'package:wambo/core/utils/enums.dart';
import 'package:wambo/modules/authentication/presentation/view/login_authentication_view_model.dart';
import 'package:wambo/modules/authentication/presentation/widgets/authentication_layout_widget.dart';

//Esta é a UI somente para visualização o resto vai para o viewmodel ou widgets.
class LoginAuthenticationView extends StatelessWidget {
  const LoginAuthenticationView({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginAuthenticationViewModel>.nonReactive(
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: kcIconDark),
              onPressed: () => pageController.jumpToPage(0),
            ),
          ),
          body: AuthenticationLayoutWidget(layoutType: LayoutType.login, onForgot: ()=> pageController.jumpToPage(3),)        );
      },
      viewModelBuilder: () => LoginAuthenticationViewModel(),
    );
  }
}
