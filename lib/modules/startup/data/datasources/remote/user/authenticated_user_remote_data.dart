import 'package:faker/faker.dart';

class AuthenticatedUserRemoteData {
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

  //TODO: need to add colors etc etc
  Map<String, Object?> get fakeappConfig => {
        "message": "sucess",
        "data": {
          "app_id": _faker.guid.guid(),
          "app_token": _faker.jwt.expired()
        }
      };
}