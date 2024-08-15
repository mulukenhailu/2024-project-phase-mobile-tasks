import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/data/repositories/create_product_repository_impl.dart';
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

  group('create Product', () {
    test('should check if the device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      createProductRepositoryImpl.createProduct(testProductModel);
      //assert
      verify(mockNetworkInfo.isConnected);
    });
  });
}
