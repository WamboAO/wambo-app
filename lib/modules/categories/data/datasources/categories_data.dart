import 'package:faker/faker.dart';

class CategoriesData {
   final _faker = Faker();
 
  
  Map<String, Object?> get fakeCategories => {
        "message": "sucess",
        "data": [
          
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
}