import 'package:faker/faker.dart';

class ProductsData {
    final _faker = Faker();
    Map<String, Object?> get fakeProduct => {
        "message": "sucess",
        "data": {
          "id": 1,
          "thumbnail":
              _faker.image.image(keywords: ["streetwear"], random: true),
          "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
          "permalink": _faker.internet.httpsUrl(),
          "currency": _faker.currency.code(),
          "created_at":
              _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
          "description":
              "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
          "price": _faker.randomGenerator.integer(100000, min: 0),
          "regular_price": _faker.randomGenerator.integer(100000, min: 0),
          "sale_price": _faker.randomGenerator.integer(100000, min: 0),
          "date_on_sale_from":
              _faker.date.dateTime(minYear: 2020, maxYear: 2021).toString(),
          "date_on_sale_to":
              _faker.date.dateTime(minYear: 2022, maxYear: 2023).toString(),
          "on_sale": _faker.randomGenerator.boolean(),
          "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
          "in_stock": _faker.randomGenerator.boolean(),
          "details": {
            "backorders_allowed": _faker.randomGenerator.boolean(),
            "sold_individually": _faker.randomGenerator.boolean(),
            "sku": "",
            "weight": _faker.randomGenerator.decimal(),
            "dimensions": {
              "length": _faker.randomGenerator.decimal(),
              "width": _faker.randomGenerator.decimal(),
              "height": _faker.randomGenerator.decimal()
            },
            "shipping_taxable_by_distance": true,
            "shipping_tax": _faker.randomGenerator.integer(5000, min: 0),
            "categories": [
              {"id": 9, "name": "Clothing", "slug": "clothing"},
              {"id": 14, "name": "T-shirts", "slug": "t-shirts"}
            ],
            "tags": [
              {"id": 9, "name": "Clothing", "slug": "clothing"},
              {"id": 14, "name": "T-shirts", "slug": "t-shirts"}
            ],
            "images": [
              {
                "id": 792,
                "created_at": "2017-03-23T14:01:13",
                "src":
                    "https://example.com/wp-content/uploads/2017/03/T_2_front-4.jpg",
                "name": "",
                "alt": "",
                "is_thumbnail": true
              },
              {
                "id": 793,
                "created_at": "2017-03-23T14:01:14",
                "src":
                    "https://example.com/wp-content/uploads/2017/03/T_2_back-2.jpg",
                "name": "",
                "alt": "",
                "is_thumbnail": false,
              }
            ],
            "attributes": [
              {
                "id": 6,
                "name": "Color",
                "position": 0,
                "variation": false,
                "options": ["Black", "Green"]
              },
              {
                "id": 0,
                "name": "Size",
                "position": 0,
                "variation": false,
                "options": ["S", "M"]
              }
            ],
          }
        }
      };

   Map<String, Object?> get fakeProducts => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "thumbnail": _faker.image.image(keywords: ["fashion"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 2,
            "thumbnail": _faker.image.image(keywords: ["kitchen"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": _faker.randomGenerator.integer(100000, min: 0),
            "date_on_sale_from":
                _faker.date.dateTime(minYear: 2020, maxYear: 2021).toString(),
            "date_on_sale_to":
                _faker.date.dateTime(minYear: 2022, maxYear: 2023).toString(),
            "on_sale": true,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 5),
            "in_stock": true,
            "details": null
          },
          {
            "id": 3,
            "thumbnail": _faker.image.image(keywords: ["hats"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": false,
            "details": null
          },
          {
            "id": 4,
            "thumbnail": _faker.image.image(keywords: ["shirts"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 5,
            "thumbnail": _faker.image.image(keywords: ["shorts"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 6,
            "thumbnail": _faker.image.image(keywords: ["pots"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 7,
            "thumbnail": _faker.image.image(keywords: ["tech"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 8,
            "thumbnail": _faker.image.image(keywords: ["blouse"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
        ]
      };
  Map<String, Object?> get fakePromos => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "thumbnail": _faker.image.image(keywords: ["beds"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": _faker.randomGenerator.integer(100000, min: 0),
            "date_on_sale_from":
                _faker.date.dateTime(minYear: 2020, maxYear: 2021).toString(),
            "date_on_sale_to":
                _faker.date.dateTime(minYear: 2022, maxYear: 2023).toString(),
            "on_sale": true,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 5),
            "in_stock": true,
            "details": null
          },
          {
            "id": 2,
            "thumbnail": _faker.image.image(keywords: ["kitchen"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": _faker.randomGenerator.integer(100000, min: 0),
            "date_on_sale_from":
                _faker.date.dateTime(minYear: 2020, maxYear: 2021).toString(),
            "date_on_sale_to":
                _faker.date.dateTime(minYear: 2022, maxYear: 2023).toString(),
            "on_sale": true,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 5),
            "in_stock": true,
            "details": null
          },
          {
            "id": 3,
            "thumbnail": _faker.image.image(keywords: ["car"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": _faker.randomGenerator.integer(100000, min: 0),
            "date_on_sale_from":
                _faker.date.dateTime(minYear: 2020, maxYear: 2021).toString(),
            "date_on_sale_to":
                _faker.date.dateTime(minYear: 2022, maxYear: 2023).toString(),
            "on_sale": true,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 5),
            "in_stock": true,
            "details": null
          },
        ]
      };

  Map<String, Object?> get fakePopular => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "thumbnail": _faker.image.image(keywords: ["pants"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 2,
            "thumbnail": _faker.image.image(keywords: ["hats"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": false,
            "details": null
          },
        ]
      };

  Map<String, Object?> get fakeRecent => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "thumbnail": _faker.image.image(keywords: ["clothes"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 2,
            "thumbnail": _faker.image.image(keywords: ["shoes"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
        ]
      };
Map<String, Object?> get fakeSuggestions => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "thumbnail": _faker.image.image(keywords: ["tablets"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 2,
            "thumbnail": _faker.image.image(keywords: ["shorts"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
        ]
      };
  Map<String, Object?> get fakeForyou => {
        "message": "sucess",
        "data": [
          {
            "id": 1,
            "thumbnail": _faker.image.image(keywords: ["gadgets"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
          {
            "id": 2,
            "thumbnail": _faker.image.image(keywords: ["fashion"]),
            "name": "${_faker.lorem.word()} ${_faker.lorem.word()}",
            "permalink": _faker.internet.httpsUrl(),
            "currency": _faker.currency.code(),
            "created_at":
                _faker.date.dateTime(minYear: 2020, maxYear: 2022).toString(),
            "description":
                "<p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend leo.</p>\n",
            "price": _faker.randomGenerator.integer(100000, min: 0),
            "regular_price": _faker.randomGenerator.integer(100000, min: 0),
            "sale_price": null,
            "date_on_sale_from": null,
            "date_on_sale_to": null,
            "on_sale": false,
            "stock_quantity": _faker.randomGenerator.integer(10, min: 0),
            "in_stock": true,
            "details": null
          },
        ]
      };
}