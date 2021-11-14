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
  Map<String, Object?> get fakeStoreInfo => {
    "message": "sucess",
        "data": {
          "promo":[
            {
              "id": 1,
              "image": _faker.image.image(),
              "tag": _faker.lorem.word()
            },
            {
              "id": 2,
              "image": _faker.image.image(),
              "tag": _faker.lorem.word()
            },
            {
              "id": 3,
              "image": _faker.image.image(),
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
}
