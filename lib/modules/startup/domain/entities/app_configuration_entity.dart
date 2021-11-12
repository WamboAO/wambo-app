import 'package:equatable/equatable.dart';

class AppConfigurationEntity extends Equatable {
  AppConfigurationEntity({ this.data});
  final AppConfigurationDataEntity? data;

  @override
  List<Object?> get props => [data];
}

class AppConfigurationDataEntity extends Equatable {
  AppConfigurationDataEntity({required this.appId, required this.appToken});
  final String appId;
  final String appToken;

  @override
  List<Object?> get props => [appId, appToken];
}
