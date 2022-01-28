import 'package:faker/faker.dart';
class NotificationData {
  final _faker = Faker();
   Map<String, Object?> get notification => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "description": _faker.lorem.sentence(),
            "created_at": _faker.date.dateTime().toString(),
            "user": {
              "id": 1,
              "username": _faker.internet.userName(),
              "avatar": _faker.image.image(keywords: ['avatar', 'people']),
            }
          },
          {
            "id": 2,
            "description": _faker.lorem.sentence(),
            "created_at": _faker.date.dateTime().toString(),
            "image": {
              "id": 1,
              "image": _faker.image.image(keywords: ["art"])
            },
            "user": {
              "id": 1,
              "username": _faker.internet.userName(),
              "avatar": _faker.image.image(keywords: ['avatar', 'people']),
            }
          },
          {
            "id": 3,
            "description": _faker.lorem.sentence(),
            "created_at": _faker.date.dateTime().toString(),
            "user": {
              "id": 1,
              "username": _faker.internet.userName(),
              "avatar": _faker.image.image(keywords: ['avatar', 'people']),
            }
          },
          {
            "id": 4,
            "description": _faker.lorem.sentence(),
            "created_at": _faker.date.dateTime().toString(),
            "image": {
              "id": 1,
              "image": _faker.image.image(keywords: ["art"])
            },
            "user": {
              "id": 1,
              "username": _faker.internet.userName(),
              "avatar": _faker.image.image(keywords: ['avatar', 'people']),
            }
          },
        ]
      };
}