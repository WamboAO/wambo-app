import 'package:faker/faker.dart';

class FakeRemoteData {
  final _faker = Faker();
  Map<String, Object?> get fakeAppConfigValues => {
        'app_id': _faker.guid.guid(),
        'app_token': _faker.jwt.expired(),
      
      };

  Map<String, Object?> get fakeAuthUserResponseValues => {
        'token': {
          'token': _faker.jwt.expired(),
          'refresh_token': _faker.guid.guid()
        },
        'user': {
          'user_id': 1,
          'first_name': _faker.person.firstName(),
          'last_name': _faker.person.lastName(),
          'phone': _faker.phoneNumber.us(),
          'email': _faker.internet.disposableEmail(),
          'avatar': _faker.image.image()
        }
      };

      Map<String, Object?> get fakeGenericValues => {
        'message': 'Verifica o seu e-mail'
      };
}
