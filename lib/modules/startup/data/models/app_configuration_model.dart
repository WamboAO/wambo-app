import 'package:wambo/modules/startup/domain/entities/app_configuration_entity.dart';

class AppConfigurationModel extends AppConfigurationEntity {
  AppConfigurationModel({AppConfigurationDataModel? data}) : super(data: data);
  factory AppConfigurationModel.fromJson(Map<String, dynamic> json) =>
      AppConfigurationModel(
          data: json['data'] != null
              ? AppConfigurationDataModel.fromJson(json['data'])
              : null);

  Map<String, dynamic> toJson() => {
        'data': data,
      };
}

class AppConfigurationDataModel extends AppConfigurationDataEntity {
  AppConfigurationDataModel({required String appId, required String appToken})
      : super(appId: appId, appToken: appToken);
  factory AppConfigurationDataModel.fromJson(Map<String, dynamic> json) =>
      AppConfigurationDataModel(
        appId: json['app_id'],
        appToken: json['app_token'],
      );

  Map<String, dynamic> toJson() => {
        'app_id': appId,
        'app_token': appToken,
      };
}
