import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/data/repositories/get_all_products_repository_impl.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockProductRemoteDatasource mockProductRemoteDatasource;
  late MockNetworkInfo mockNetworkInfo;
  late GetAllProductsRepositoryImpl getAllProductsRepositoryImpl;

  setUp(() {
    mockProductRemoteDatasource = MockProductRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    getAllProductsRepositoryImpl = GetAllProductsRepositoryImpl(
        remoteDatasource: mockProductRemoteDatasource,
        networkInfo: mockNetworkInfo);
  });

  const List<ProductModel> productModelList = [
    ProductModel(
        id: '1',
        name: 'suzuki',
        description: 'norma',
        imageUrl: 'path/to/suzuki',
        price: 1000.00)
  ];


  group('check if the deivce is online', () {
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockProductRemoteDatasource.getAllProduct())
          .thenAnswer((_) async => productModelList);
      //act
      getAllProductsRepositoryImpl.getAllProduct();
      //assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  group('get all product', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should return all the availble product when the call to the remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDatasource.getAllProduct())
          .thenAnswer((_) async => productModelList);
      //act
      final result = await getAllProductsRepositoryImpl.getAllProduct();
      final productEntityList = result.fold((failure) => null, (productList) => productList);
      expect(result, equals(Right(productEntityList)));
    });

    test(
        'should return ServerFailure when the call to remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDatasource.getAllProduct())
          .thenThrow(ServerException());
      //act
      final result = await getAllProductsRepositoryImpl.getAllProduct();
      expect(result, equals(const Left(ServerFailure(message: 'Server Failure'))));
    });
  });
}
