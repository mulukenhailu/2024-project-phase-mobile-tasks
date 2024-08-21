import '../models/product_model.dart';

abstract class ProductRemoteDatasource{
  Future<ProductModel> createProduct(ProductModel product);
  Future<void> deleteProduct(String id);
  Future<List<ProductModel>> getAllProduct();
  Future<ProductModel> getProduct(String id);
  Future< ProductModel> updateProduct(ProductModel product);
}