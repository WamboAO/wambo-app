import 'package:faker/faker.dart';

class SearchData {
  final _faker = Faker();
  int get index => _faker.randomGenerator.integer(10, min: 0);
  Map<String, Object?> get fakeSearchList => {
        "message": "sucess",
        "data": [
          {"id": 1, "name": _faker.lorem.word()},
          {"id": 2, "name": _faker.lorem.word()},
          {"id": 3, "name": _faker.lorem.word()},
          {"id": 4, "name": _faker.lorem.word()},
          {"id": 5, "name": _faker.lorem.word()},
          {"id": 6, "name": _faker.lorem.word()},
          {"id": 7, "name": _faker.lorem.word()},
          {"id": 8, "name": _faker.lorem.word()},
        ]
      };
  Map<String, Object?> get fakeSearchItem =>
      {"id": 1, "name": _faker.lorem.word()};
}
