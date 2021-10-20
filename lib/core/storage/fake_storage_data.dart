 import 'package:faker/faker.dart';

class FakeLocalData {
  final _faker = Faker();
Map<String, Object> get fakeAuthValues => {
      // "token": _faker.jwt.expired(),
      // "refresh_token": _faker.guid.guid(),
      // "user_id": 1,
      // "first_name": _faker.person.firstName(),
      // "last_name": _faker.person.lastName(),
      // "email": _faker.internet.freeEmail(),
      // "phone": _faker.phoneNumber.us(),
      // "avatar": _faker.image.image(),
      // 'app_token': _faker.jwt.expired(),
    };
}