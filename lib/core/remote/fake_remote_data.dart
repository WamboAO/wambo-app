import 'package:faker/faker.dart';

class FakeRemoteData {
  final _faker = Faker();
  Map<String, Object> get fakeAppConfigValues => {
        'app_id': _faker.guid.guid(),
        'app_token': _faker.jwt.expired(),
        'show_logo': true
      };
}
