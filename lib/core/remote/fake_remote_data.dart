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
        "data": [
          {
            "id": 1,
            "image": _faker.image.image(keywords: ["promotion", "sale"]),
            "tag": _faker.lorem.word()
          },
          {
            "id": 2,
            "image": _faker.image.image(keywords: ["flyer", "sale"]),
            "tag": _faker.lorem.word()
          },
          {
            "id": 3,
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "image": _faker.image.image(keywords: ["promotion", "discount"]),
            "tag": _faker.lorem.word()
          },
        ]
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

  Map<String, Object?> get fakeProducts => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "clothes"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 2,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "shoes"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 3,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "hats"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 4,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "shirts"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": 0.1,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 5,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["model"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": false,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 6,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "african"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": 0.2,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 7,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "sneakers"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": 0.25,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 8,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "blouse"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          }
        ]
      };
  Map<String, Object?> get fakePromos => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "clothes"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": 0.8,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 2,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "shoes"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": 0.2,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 3,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "hats"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": 0.1,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
        ]
      };

  Map<String, Object?> get fakePopular => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "clothes"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": false,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 2,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "shoes"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
        ]
      };

  Map<String, Object?> get fakeRecent => {
        "message": "sucess",
        "data": [
          {
            "id": 7,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "sneakers"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": 0.25,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 8,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["fashion", "blouse"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          }
        ]
      };

  Map<String, Object?> get fakeForyou => {
        "message": "sucess",
        "data": [
          {
            "id": 7,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["kitchenware"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": null,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          },
          {
            "id": 8,
            "title": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "thumbnail": _faker.image.image(keywords: ["gadget"]),
            "bought_count": _faker.randomGenerator.integer(1000, min: 0),
            "currency": "Kz",
            "discount": 0.15,
            "price": _faker.randomGenerator.integer(100000, min: 1000),
            "in_stock": true,
            "like_count": _faker.randomGenerator.integer(100000, min: 0),
            "created_at": DateTime.now().toString(),
            "details": null
          }
        ]
      };

  Map<String, Object?> get fakeSearchList => {
    "message": "sucess",
    "data": [
      {
        "id": 1,
        "name": _faker.lorem.word()
      },
      {
        "id": 2,
        "name": _faker.lorem.word()
      },
      {
        "id": 3,
        "name": _faker.lorem.word()
      },
      {
        "id": 4,
        "name": _faker.lorem.word()
      },
      {
        "id": 5,
        "name": _faker.lorem.word()
      },
      {
        "id": 6,
        "name": _faker.lorem.word()
      },
      {
        "id": 7,
        "name": _faker.lorem.word()
      },
      {
        "id": 8,
        "name": _faker.lorem.word()
      },
    ]
  };
}
