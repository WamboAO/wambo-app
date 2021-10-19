import 'package:flutter/material.dart';
import 'package:wambo/core/interfaces/stoppable_interface.dart';
import 'package:wambo/modules/startup/presentation/services/refresh_token_service.dart';

import 'locator.dart';





class LifeCycleManager extends StatefulWidget {
  
  LifeCycleManager({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  _LifeCycleManagerState createState() => _LifeCycleManagerState();
}

class _LifeCycleManagerState extends State<LifeCycleManager>
    with WidgetsBindingObserver {
 final List<IstoppableService> services = [
  locator<RefreshTokenService>()
    
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
    for(var service in services){
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
