import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/feature/product/data/repositories/delete_product_repository_impl.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/delete_product_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late DeleteProductRepositoryImpl deleteProductRepositoryImpl;
  late MockProductRemoteDatasource mockProductRemoteDatasource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockProductRemoteDatasource = MockProductRemoteDatasource();
    mockNetworkInfo = MockNetworkInfo();
    deleteProductRepositoryImpl = DeleteProductRepositoryImpl(
        remoteDatasource: mockProductRemoteDatasource,
        networkInfo: mockNetworkInfo);
  });

  const testId = '1';

  group('delte product', () {
    test('should check if the device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      deleteProductRepositoryImpl.deleteProduct(testId);
      //assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  group('the device online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test(
        'should delete the product when the call to the remote data source is successful',
        () async {
      //arrange
      when(mockProductRemoteDatasource.deleteProduct(testId)).thenAnswer((_) async => Null);
      //act
      final result = await deleteProductRepositoryImpl.deleteProduct(testId);
      //assert
      verify(mockProductRemoteDatasource.deleteProduct(testId));
      expect(result, equals(const Right(null)));
    });

      test('should return ServerExecption when the call to the remote data source is unsuccessful',
        () async {
      //arrange
      when(mockProductRemoteDatasource.deleteProduct(testId)).thenThrow(ServerException());
      //act
      final result = await deleteProductRepositoryImpl.deleteProduct(testId);
      //assert
      verify(mockProductRemoteDatasource.deleteProduct(testId));
      expect(result, equals(const Left(ServerFailure(message: 'server failure'))));
    });
  });
}
