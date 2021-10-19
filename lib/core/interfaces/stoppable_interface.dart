import 'package:flutter/material.dart';

abstract class IstoppableService {
  bool _serviceStopped = false; 
  bool get serviceStopped => _serviceStopped; 

  @mustCallSuper

  void stop(){
    _serviceStopped = true;
  }


  @mustCallSuper

  void start(){
    _serviceStopped = false;
  }
}