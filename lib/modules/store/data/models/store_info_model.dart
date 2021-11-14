import 'package:wambo/modules/store/domain/entities/store_info_entity.dart';

class StoreInfoModel extends StoreInfoEntity {
  StoreInfoModel({required String message, required StoreInfoDataModel data})
      : super(message: message, data: data);
  factory StoreInfoModel.fromJson(Map<String, dynamic> json) => StoreInfoModel(
      message: json['message'],
      data: StoreInfoDataModel.fromJson(json['data']));
}

class StoreInfoDataModel extends StoreInfoDataEntity {
  StoreInfoDataModel(
      {required List<StoreInfoPromoModel> promo,
      required List<StoreInfoTagsModel> tags})
      : super(promo: promo, tags: tags);
  factory StoreInfoDataModel.fromJson(Map<String, dynamic> json) {
    List<StoreInfoTagsModel> _tags = <StoreInfoTagsModel>[];
    json['tags'].forEach((v) {
      _tags.add(StoreInfoTagsModel.fromJson(v));
    });
    List<StoreInfoPromoModel> _promo = <StoreInfoPromoModel>[];
    json['promo'].forEach((v) {
      _promo.add(StoreInfoPromoModel.fromJson(v));
    });
    return StoreInfoDataModel(promo: _promo, tags: _tags);
  }
}

class StoreInfoPromoModel extends StoreInfoPromoEntity {
  StoreInfoPromoModel({required int id, required String image, required String tag})
      : super(id: id, image: image, tag: tag);
  factory StoreInfoPromoModel.fromJson(Map<String, dynamic> json) =>
      StoreInfoPromoModel(id: json['id'], image: json['image'], tag: json['tag']);
}

class StoreInfoTagsModel extends StoreInfoTagsEntity {
  StoreInfoTagsModel(
      {required int id, required String title, required String description})
      : super(id: id, title: title, description: description);

  factory StoreInfoTagsModel.fromJson(Map<String, dynamic> json) =>
      StoreInfoTagsModel(
          id: json['id'],
          title: json['title'],
          description: json['description']);
}
