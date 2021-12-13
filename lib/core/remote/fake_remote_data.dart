import 'package:faker/faker.dart';

class FakeRemoteData {
  final _faker = Faker();
  Map<String, Object?> get fakeAuthValues => {
        "message": "sucess",
        "data": {
          "token": _faker.jwt.expired(),
          "refresh_token": _faker.guid.guid(),
          "user": {
            "id": 1,
            'email': _faker.internet.freeEmail(),
            'name': _faker.person.name(),
            'phone': _faker.phoneNumber.us(),
            'birthday': _faker.date.dateTime().toString(),
            'gender': "Male",
            'address': _faker.address.streetAddress(),
            'avatar': _faker.image.image(),
            'role': "regular",
            'created_at': _faker.date.dateTime().toString(),
          }
        }
      };

  Map<String, Object?> get fakeappConfig => {
        "message": "sucess",
        "data": {
          "app_id": _faker.guid.guid(),
          "app_token": _faker.jwt.expired()
        }
      };
  Map<String, Object?> get fakeCategories => {
     "message": "sucess",
        "data": [
          {
            "id": 1,
            "category": "Tudo",
            "is_active": true,
          },
          {
            "id": 2,
            "category": "Electrodomésticos",
            "is_active": true,
          },
           {
            "id": 3,
            "category": "Eletrônicos",
            "is_active": true,
          },
          {
            "id": 4,
            "category": "Saúde e cosméticos",
            "is_active": true,
          },
           {
            "id": 5,
            "category": "Moda e acessórios",
            "is_active": true,
          },
          {
            "id": 6,
            "category": "Esporte e lazer",
            "is_active": true,
          },
        ]
  };
  Map<String, Object?> get fakeStoreInfo => {
        "message": "sucess",
        "data": {
          "promo": [
            {
              "id": 1,
              "image": _faker.image.image(keywords: ["promotion", "sale"]),
              "tag": _faker.lorem.word()
            },
            {
              "id": 2,
              "image": _faker.image.image(keywords: ["promotion", "sale"]),
              "tag": _faker.lorem.word()
            },
            {
              "id": 3,
              "image": _faker.image.image(keywords: ["promotion", "sale"]),
              "tag": _faker.lorem.word()
            },
          ],
          "tags": [
            {
              "id": 1,
              "title": _faker.lorem.word(),
              "description": "${_faker.lorem.word()} ${_faker.lorem.word()}"
            },
            {
              "id": 2,
              "title": _faker.lorem.word(),
              "description": "${_faker.lorem.word()} ${_faker.lorem.word()}"
            },
            {
              "id": 3,
              "title": _faker.lorem.word(),
              "description": "${_faker.lorem.word()} ${_faker.lorem.word()}"
            }
          ]
        }
      };
      Map<String, Object?> get fakeNotification => {
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
