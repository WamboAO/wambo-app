import 'package:wambo/modules/notification/domain/entities/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel(
      {required String message, required List<NotificaionDataModel> data})
      : super(message: message, data: data);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    List<NotificaionDataModel> _data = <NotificaionDataModel>[];
    json['data'].forEach((v) {
      _data.add(NotificaionDataModel.fromJson(v));
    });

    return NotificationModel(message: json['message'], data: _data);
  }
}

class NotificaionDataModel extends NotificationDataEntity {
  NotificaionDataModel(
      {required int id,
      required String description,
      required NotificationUserModel user,
      NotificationImageModel? image,
      required String createdAt})
      : super(
            id: id, description: description, user: user, createdAt: createdAt, image: image);

  factory NotificaionDataModel.fromJson(Map<String, dynamic> json) =>
      NotificaionDataModel(
          id: json['id'],
          description: json['description'],
          image: json['image'] != null? NotificationImageModel.fromJson(json['image']): null,
          user: NotificationUserModel.fromJson(json['user']),
          createdAt: json['created_at']);
}

class NotificationUserModel extends NotificationUserEntity {
  NotificationUserModel(
      {required int id, required String username, required String avatar})
      : super(id: id, username: username, avatar: avatar);

  factory NotificationUserModel.fromJson(Map<String, dynamic> json) =>
      NotificationUserModel(
          id: json['id'], username: json['username'], avatar: json['avatar']);
}

class NotificationImageModel extends NotificationImageEntity {
  NotificationImageModel(
      {required int id,  required String image})
      : super(id: id,  image: image);

  factory NotificationImageModel.fromJson(Map<String, dynamic> json) =>
      NotificationImageModel(
          id: json['id'],  image: json['image']);
}
