import 'package:wambo/modules/posters/domain/entities/store_info_entity.dart';

class StoreInfoModel extends StoreInfoEntity {
  StoreInfoModel(
      {required String message, required List<StoreInfoDataModel> data})
      : super(message: message, data: data);
  factory StoreInfoModel.fromJson(Map<String, dynamic> json) {
    List<StoreInfoDataModel> _data = <StoreInfoDataModel>[];
    json['data'].forEach((v) {
      _data.add(StoreInfoDataModel.fromJson(v));
    });
    return StoreInfoModel(message: json['message'], data: _data);
  }
}

class StoreInfoDataModel extends StoreInfoDataEntity {
  StoreInfoDataModel(
      {required int id, required String image, required String tag})
      : super(id: id, image: image, tag: tag);
  factory StoreInfoDataModel.fromJson(Map<String, dynamic> json) =>
      StoreInfoDataModel(
          id: json['id'], image: json['image'], tag: json['tag']);
}
