 import 'package:faker/faker.dart';

class FakeLocalData {
  final _faker = Faker();
Map<String, Object> get fakeAuthValues => {
      "token": _faker.jwt.expired(),
      "refresh_token": _faker.guid.guid(),
      "user_id": 1,
      "username": _faker.internet.userName(),
      "avatar": _faker.image.image(),
      "is_first_time": true
    };
}