import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/modules/account/presentation/views/account_view_model.dart';

class AccountView extends StatelessWidget {
 const AccountView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<AccountViewModel>.nonReactive(
     builder: (context, model, child) {
        return  const Scaffold(
          body: Center(child: Text("Account"),),
        );
        },
     viewModelBuilder: () => AccountViewModel(),
   );
 }
}