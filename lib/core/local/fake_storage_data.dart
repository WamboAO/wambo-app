import 'package:faker/faker.dart';

class FakeLocalData {
  final _faker = Faker();
  Map<String, Object> get fakeAuthValues => {
        'id': 1,
        'email': _faker.internet.freeEmail(),
        'name': _faker.person.name(),
        'phone': _faker.phoneNumber.us(),
        'birthday': _faker.date.dateTime().toString(),
        'gender': "Male",
        'address': _faker.address.streetAddress(),
        'avatar': _faker.image.image(),
        'role': "regular",
        'created_at': _faker.date.dateTime().toString(),
        'token': _faker.jwt.expired(),
        'refresh_token': _faker.guid.guid(),
        'app_id': _faker.guid.guid(),
        'app_token': _faker.jwt.expired()
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
