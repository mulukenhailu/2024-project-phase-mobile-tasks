import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/product_model.dart';
import 'product_remote_data_source.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDatasource {
  final http.Client httpClient;
  ProductRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<ProductModel> createProduct(ProductModel product) async {
    const testCreateProductModel = ProductModel(
      id: '66bde8af9bbe07fc39034d13',
      name: 'PC',
      description: 'long description',
      price: 123,
      imageUrl:
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723721903/images/ldbvucbl012gy90gsuam.png',
    );
    final response = await httpClient.post(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v2/products'),
        headers: {
          'Content-Type': 'application/json'
        },
        body: {
          'id': '66bde8af9bbe07fc39034d13',
          'name': 'PC',
          'description': 'long description',
          'imageUrl':
              'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723721903/images/ldbvucbl012gy90gsuam.png',
          'price': 123.4
        });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Map<String, dynamic> jsonProductModel = jsonResponse['data'];
      ProductModel productModel = ProductModel.fromJson(jsonProductModel);
      return productModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    final response = await httpClient.delete(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      return Future.value();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<ProductModel>> getAllProduct() async {
    final response = await httpClient.get(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
        headers: {'Content-Type': 'application/jdon'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> jsonProducts = jsonResponse['data'];
      List<ProductModel> productModels = jsonProducts
          .map((jsonProduct) => ProductModel.fromJson(jsonProduct))
          .toList();

      return productModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> getProduct(String id) async {
    final response = await httpClient.get(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$id'),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Map<String, dynamic> productData = jsonResponse['data'];
      final ProductModel productModel = ProductModel.fromJson(productData);
      return productModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<ProductModel> updateProduct(ProductModel product) async {
    final response = await httpClient.put(
        Uri.parse(
            'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$product.id'),
        headers: {'Content-Type': 'application/json'},
        body: {'name': product.name, 'description': product.description, 'price': product.price});

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final Map<String, dynamic> productData = jsonResponse['data'];
      final ProductModel productModel = ProductModel.fromJson(productData);
      return Future.value(productModel);
    } else {
      throw ServerException();
    }
  }
}
