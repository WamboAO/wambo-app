import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';

class AppConfigurationModel extends AppConfigurationEntity {
  AppConfigurationModel({required String appId, required String appToken}) : super(appId: appId, appToken: appToken);
  factory AppConfigurationModel.fromJson(Map<String, dynamic> json) =>
      AppConfigurationModel(
          appId: json['app_id'],
          appToken: json['app_token'],
          
        );

  Map<String, dynamic> toJson() => {
        'app_id': appId,
        'app_token': appToken,  
      };
}