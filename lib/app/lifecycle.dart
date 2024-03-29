import 'package:flutter/material.dart';
import 'package:wambo/app/imports.dart';
import 'package:wambo/app/locator.dart';
import 'package:interfaces/interfaces.dart';



class LifeCycleManager extends StatefulWidget {
  const LifeCycleManager({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
  final List<Istoppable> services = [
    locator<GetAuthenticatedUserService>(),
    locator<GetStoreInfoService>(),
  ];

  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    for (var service in services) {
      if (state == AppLifecycleState.resumed) {
        service.start();
      } else {
        service.stop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
