import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/features/startup/presentation/view/authentication/authentication_view_model.dart';

class AuthenticationView extends StatelessWidget {
  const AuthenticationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticationViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: Center(
            child: Text('${model.isLoggedin}'),
          ),
        );
      },
      viewModelBuilder: () => AuthenticationViewModel(),
    );
  }
}
