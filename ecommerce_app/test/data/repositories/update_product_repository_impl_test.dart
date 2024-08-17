import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/data/repositories/update_product_repository_impl.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late UpdateProductRepositoryImpl updateProductRepositoryImpl;
  late MockProductRemoteDatasource mockProductRemoteDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockProductRemoteDatasource = MockProductRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    updateProductRepositoryImpl = UpdateProductRepositoryImpl(
        remoteDatasource: mockProductRemoteDatasource,
        networkInfo: mockNetworkInfo);
  });

  const testId = '1';

  const productEntity = ProductEntity(
      id: '1',
      name: 'suzuki',
      description: 'norma',
      imageUrl: 'path/to/suzuki',
      price: 1000.00);

  const testProductModel = ProductModel(
      id: '1',
      name: 'suzuki',
      description: 'norma',
      imageUrl: 'path/to/suzuki',
      price: 1000.00);

  group('update product', () {
    test('should check if the deivce is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockProductRemoteDatasource.updateProduct(testId))
          .thenAnswer((_) async => testProductModel);
      //act
      updateProductRepositoryImpl.updateProduct(testId);
      // assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test(
        'should update the product when the call to the remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDatasource.updateProduct(testId))
          .thenAnswer((_) async => testProductModel);
      //act
      final result = await updateProductRepositoryImpl.updateProduct(testId);
      //assert
      verify(mockNetworkInfo.isConnected);
      verify(mockProductRemoteDatasource.updateProduct(testId));
      expect(result, equals(const Right(productEntity)));
    });

    test(
        'should return ServerException when the call to the remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDatasource.updateProduct(testId))
          .thenThrow(ServerException());
      //act
      final result = await updateProductRepositoryImpl.updateProduct(testId);
      //assert
      verify(mockProductRemoteDatasource.updateProduct(testId));
      expect(result, const Left(ServerFailure(message: 'Server Failure')));
    });
  });

  group('the device is offline', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    });
    test(
        'should return SocketException when the device failed to connect to the internet',
        () async {
      //arrange
      when(mockProductRemoteDatasource.updateProduct(testId))
          .thenThrow(SocketException());
      //act
      final result = await updateProductRepositoryImpl.updateProduct(testId);
      //assert
      verifyZeroInteractions(mockProductRemoteDatasource);
      expect(result, const Left(SocketFailure(message: 'Socket Failure')));
    });
  });
}
