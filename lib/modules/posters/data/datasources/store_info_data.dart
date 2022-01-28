import 'package:faker/faker.dart';

class StoreInfoData {
  final _faker = Faker();
 
  
  
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
            "image": _faker.image.image(keywords: ["flyer"]),
            "tag": _faker.lorem.word()
          },
          {
            "id": 3,
            "image": _faker.image.image(keywords: ["promotion", "discount"]),
            "tag": _faker.lorem.word()
          },
        ]
      };
 

 

  

  
  
}
