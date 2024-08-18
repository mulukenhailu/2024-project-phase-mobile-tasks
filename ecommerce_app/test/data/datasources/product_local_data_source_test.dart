import 'dart:convert';

import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/feature/product/data/datasource/product_local_data_source.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockSharedPreferences mockSharedPreferences;
  late ProductLocalDataSourceImpl productLocalDataSourceImpl;

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    productLocalDataSourceImpl =
        ProductLocalDataSourceImpl(sharedPreferences: mockSharedPreferences);
  });

  group('getAllcachedProduct', () {
    final testProductModel =
        ProductModel.fromJson(json.decode(fixture('product_cached.json')));
    test('should return cached product from sharedPreference when this is one',
        () async {
      //arrange
      when(mockSharedPreferences.getString(any))
          .thenReturn(fixture('product_cached.json'));
      //act
      final result = await productLocalDataSourceImpl.getAllCachedProduct();
      //assert
      verify(mockSharedPreferences.getString('CACHED_PRODUCT'));
      expect(result, equals(testProductModel));
    });

    test('should throw cacheException when there is no a cached value',
        () async {
      //arrange
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      //act
      Future<ProductModel> call() =>
          productLocalDataSourceImpl.getAllCachedProduct();
      //assert
      expect(call, throwsA(isA<CacheException>()));
    });
  });

  group('cacheProduct', () {
    final testProductModel =
        ProductModel.fromJson(json.decode(fixture('product_cached.json')));
    test('should call sharePreference to the cache the product', () async {
      //arrange
       when(mockSharedPreferences.setString(any, any))
          .thenAnswer((_) async => Future.value(true));
      //act
      productLocalDataSourceImpl.cacheProduct(testProductModel);
      //assert
      final expectedJsonString = json.encode(testProductModel.toJson());
      verify(mockSharedPreferences.setString(
          'CACHED_PRODUCT', expectedJsonString));
    });
  });
}
