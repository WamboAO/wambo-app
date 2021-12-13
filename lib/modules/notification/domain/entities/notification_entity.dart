import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  NotificationEntity({
    required this.message,
    required this.data,
  });
  final String message;
  final List<NotificationDataEntity> data;

  @override
  List<Object?> get props => [message, data];
}

class NotificationDataEntity extends Equatable {
  NotificationDataEntity({
    required this.id,
    required this.description,
    required this.user,
    required this.createdAt,
    this.image,
  });
  final int id;
  final String description;
  final NotificationImageEntity? image;
  final NotificationUserEntity user;
  final String createdAt;

  @override
  List<Object?> get props => [id, description, user, createdAt, image];
}

class NotificationUserEntity extends Equatable {
  NotificationUserEntity({
    required this.id,
    required this.username,
    required this.avatar,
  });
  final int id;
  final String username;
  final String avatar;

  @override
  List<Object?> get props => [id, username, avatar];
}

class NotificationImageEntity extends Equatable {
  NotificationImageEntity({
    required this.id,
    required this.image,
  });
  final int id;
  final String image;
  
  @override
  List<Object?> get props => [id, image];
}
