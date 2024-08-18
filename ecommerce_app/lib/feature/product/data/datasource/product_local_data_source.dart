import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/error/exception.dart';
import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  //caching happen when we create and get a product
  Future<void> cacheProduct(ProductModel product);

  Future<ProductModel> getAllCachedProduct();
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final SharedPreferences sharedPreferences;
  ProductLocalDataSourceImpl({required this.sharedPreferences});
  @override
  Future<void> cacheProduct(ProductModel productModel) {
    sharedPreferences.setString(
        'CACHED_PRODUCT', json.encode(productModel.toJson()));
    return Future.value(null);
  }

  @override
  Future<ProductModel> getAllCachedProduct() {
    final jsonString = sharedPreferences.getString('CACHED_PRODUCT');
    if (jsonString != null) {
      return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
}
