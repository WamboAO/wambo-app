import 'package:equatable/equatable.dart';

class AppConfigurationEntity extends Equatable {
  AppConfigurationEntity({required this.appId, required this.appToken, required this.showLogo});
  final String appId;
  final String appToken;
  final bool showLogo;

  @override
  List<Object?> get props => [appId, appToken, showLogo];
}
