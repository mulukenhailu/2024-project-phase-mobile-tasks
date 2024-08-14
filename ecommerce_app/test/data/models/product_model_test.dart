import 'dart:convert';

import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../fixtures/fixture_reader.dart';

void main() {
  const testProductModel = ProductModel(
      id: 1,
      name: 'Nike',
      description: 'land airPlane',
      imageUrl: 'path/to/image',
      price: 2000.00);

  test('should be a subclass of product entity', () async {
    //assert
    expect(testProductModel, isA<ProductEntity>());
  });

  group('from json', () {
    test('should return avalid product model from json int price', () {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('product_int_price.json'));
      //act
      final result = ProductModel.fromJson(jsonMap);

      //assert
      expect(result, testProductModel);
    });

    test('should return avalid product model from json double price', () {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(fixture('product_double_price.json'));
      //act
      final result = ProductModel.fromJson(jsonMap);

      //assert
      expect(result, testProductModel);
    });
  });

  group('to json', () {
    test('should return valid Json map containg proper data', () {
      //act
      final result = testProductModel.toJson();
      final expectedResult = {
        'id': 1,
        'name': 'Nike',
        'description': 'land airPlane',
        'imageUrl': 'path/to/image',
        'price': 2000.00
      };
      //assert
      expect(result, expectedResult);
    });
  });
}
