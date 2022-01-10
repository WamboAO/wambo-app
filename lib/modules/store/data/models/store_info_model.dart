import 'package:wambo/modules/store/domain/entities/store_info_entity.dart';

class StoreInfoModel extends StoreInfoEntity {
  StoreInfoModel({required String message, required StoreInfoDataModel data})
      : super(message: message, data: data);
  factory StoreInfoModel.fromJson(Map<String, dynamic> json) => StoreInfoModel(
      message: json['message'],
      data: StoreInfoDataModel.fromJson(json['data']));
}

class StoreInfoDataModel extends StoreInfoDataEntity {
  StoreInfoDataModel({
    required List<StoreInfoPromoModel> promo,
  }) : super(
          promo: promo,
        );
  factory StoreInfoDataModel.fromJson(Map<String, dynamic> json) {
    List<StoreInfoPromoModel> _promo = <StoreInfoPromoModel>[];
    json['promo'].forEach((v) {
      _promo.add(StoreInfoPromoModel.fromJson(v));
    });
    return StoreInfoDataModel(promo: _promo);
  }
}

class StoreInfoPromoModel extends StoreInfoPromoEntity {
  StoreInfoPromoModel(
      {required int id, required String image, required String tag})
      : super(id: id, image: image, tag: tag);
  factory StoreInfoPromoModel.fromJson(Map<String, dynamic> json) =>
      StoreInfoPromoModel(
          id: json['id'], image: json['image'], tag: json['tag']);
}
