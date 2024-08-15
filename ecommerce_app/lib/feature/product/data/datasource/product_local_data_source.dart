import '../models/product_model.dart';

abstract class ProductLocalDataSource {
  //caching happen when we create and get a product
  Future<void> cacheProduct(ProductModel product);

  Future<ProductModel> getAllCachedProduct();
}
