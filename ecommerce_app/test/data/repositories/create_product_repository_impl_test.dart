import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/data/repositories/create_product_repository_impl.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late MockProductRemoteDatasource mockProductRemoteDatasource;
  late MockProductLocalDataSource mockProductLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late CreateProductRepositoryImpl createProductRepositoryImpl;

  setUp(() {
    mockProductRemoteDatasource = MockProductRemoteDatasource();
    mockProductLocalDataSource = MockProductLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();

    createProductRepositoryImpl = CreateProductRepositoryImpl(
        remoteDatasource: mockProductRemoteDatasource,
        localDataSource: mockProductLocalDataSource,
        networkInfo: mockNetworkInfo);
  });

  const testProductModel = ProductModel(
      id: '1',
      name: 'suzuki',
      description: 'norma',
      imageUrl: 'path/to/suzuki',
      price: 1000.00);

  const productEntity = ProductEntity(
      id: '1',
      name: 'suzuki',
      description: 'norma',
      imageUrl: 'path/to/suzuki',
      price: 1000.00);

  void runTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

       body();
    });
  }

  void runTestOffline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
       body();
    });
  }

  group('create Product', () {
    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockProductRemoteDatasource.createProduct(testProductModel))
          .thenAnswer((_) async => testProductModel);
      //act
      createProductRepositoryImpl.createProduct(testProductModel);
      //assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  runTestOnline(() {
    test(
        'should create product when the call to remote data source is successful ',
        () async {
      // arrange
      when(mockProductRemoteDatasource.createProduct(testProductModel))
          .thenAnswer((_) async => testProductModel);
      // act
      final result =
          await createProductRepositoryImpl.createProduct(testProductModel);
      // assert
      verify(mockProductRemoteDatasource.createProduct(testProductModel));
      expect(result, equals(const Right(productEntity)));
    });

    test(
        'should cache product when the call to remote data source is successful',
        () async {
      // arrange
      when(mockProductRemoteDatasource.createProduct(testProductModel))
          .thenAnswer((_) async => testProductModel);
      // act
      await createProductRepositoryImpl.createProduct(testProductModel);
      // assert
      verify(mockProductRemoteDatasource.createProduct(testProductModel));
      verify(mockProductLocalDataSource.cacheProduct(testProductModel));
    });

    test(
        'should return server exception when the call to remote data source is unsuccessful ',
        () async {
      // arrange
      when(mockProductRemoteDatasource.createProduct(testProductModel))
          .thenThrow(ServerException());
      // act
      final result =
          await createProductRepositoryImpl.createProduct(testProductModel);
      // assert
      verify(mockProductRemoteDatasource.createProduct(testProductModel));
      verifyZeroInteractions(mockProductLocalDataSource);
      expect(
          result, equals(const Left(ServerFailure(message: 'Server Failure'))));
    });
  });

  runTestOffline(() {
    test('should return the last locally cached product when the call to the remote data source is unsuccessful',
        () async {
      //arrage
      when(mockProductLocalDataSource.getAllCachedProduct())
          .thenAnswer((_) async => testProductModel);

      //act
      final result =  await createProductRepositoryImpl.createProduct(testProductModel);

      //assert
      verify(mockProductLocalDataSource.getAllCachedProduct());
      verifyZeroInteractions(mockProductRemoteDatasource);
      expect(result, equals(const Right(productEntity)));
    });

    test('should return cache failure when the there is no cached product',
        () async {
      //arrage
      when(mockProductLocalDataSource.getAllCachedProduct())
          .thenThrow(CacheException());

      //act
      final result =
          await createProductRepositoryImpl.createProduct(testProductModel);

      //assert
      verify(mockProductLocalDataSource.getAllCachedProduct());
      verifyZeroInteractions(mockProductRemoteDatasource);
      expect(
          result, equals(const Left(CacheFailure(message: 'cache failure'))));
    });
  });
}
