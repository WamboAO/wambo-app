import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:wambo/modules/notification/presentation/views/notification_view_model.dart';

class NotificationView extends StatelessWidget {
 const NotificationView({Key? key}) : super(key: key);

 @override
 Widget build(BuildContext context) {
   return ViewModelBuilder<NotificationViewModel>.nonReactive(
     builder: (context, model, child) {
        return  const Scaffold(
          body: Center(child: Text("notificaiton"),),
        );
        },
     viewModelBuilder: () => NotificationViewModel(),
   );
 }
}