import 'package:equatable/equatable.dart';

class AppConfigurationEntity extends Equatable {
  AppConfigurationEntity({required this.appId, required this.appToken});
  final String appId;
  final String appToken;

  @override
  List<Object?> get props => [appId, appToken];
}
