import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/data/repositories/get_product_repository_impl.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetProductRepositoryImpl getProductRepositoryImpl;
  late MockProductRemoteDatasource mockProductRemoteDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockProductRemoteDatasource = MockProductRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    getProductRepositoryImpl = GetProductRepositoryImpl(
        remoteDatasource: mockProductRemoteDatasource,
        networkInfo: mockNetworkInfo);
  });

  const testId = '1';

  const testProductEntity = ProductEntity(
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

  group('get a Product', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });
    test('should check if the device is online', () async {
      //arrange
      when(mockProductRemoteDatasource.getProduct(testId))
          .thenAnswer((_) async => testProductModel);
      //act
      getProductRepositoryImpl.getProduct(testId);
      //assert
      verify(mockNetworkInfo.isConnected);
    });

    group('get a product', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });
      test(
          'should return the product when the call to the remote data is successul',
          () async {
        //arrange
        when(mockProductRemoteDatasource.getProduct(testId))
            .thenAnswer((_) async => testProductModel);
        //act
        final result = await getProductRepositoryImpl.getProduct(testId);
        //assert
        verify(mockNetworkInfo.isConnected);
        verify(mockProductRemoteDatasource.getProduct(testId));
        expect(result, const Right(testProductEntity));
      });

      test(
          'should return ServerException when the call to the remote data source is unsuccessful',
          () async {
        //arrange
        when(mockProductRemoteDatasource.getProduct(testId))
            .thenThrow(ServerException());
        //act
        final result = await getProductRepositoryImpl.getProduct(testId);
        //assert
        verify(mockNetworkInfo.isConnected);
        verify(mockProductRemoteDatasource.getProduct(testId));
        expect(result, const Left(ServerFailure(message: 'Server Failure')));
      });

      
      test(
          'should return SocketException when there is no internet connection',
          () async {
        //arrange
        when(mockProductRemoteDatasource.getProduct(testId))
            .thenThrow(SocketException());
        //act
        final result = await getProductRepositoryImpl.getProduct(testId);
        //assert
        verify(mockNetworkInfo.isConnected);
        verify(mockProductRemoteDatasource.getProduct(testId));
        expect(result, const Left(SocketFailure(message: 'Server Failure')));
      });
    }); 
  });
}
