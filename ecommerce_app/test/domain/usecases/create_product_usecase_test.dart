import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/create_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late CreateProductUsecase createProductUsecase;
  late MockCreateProductRepository mockCreateProductRepository;

  setUp(() {
    mockCreateProductRepository = MockCreateProductRepository();
    createProductUsecase = CreateProductUsecase(mockCreateProductRepository);
  });

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

  test('should create product from the respository', () async {

    //arrange
    when(mockCreateProductRepository.createProduct(testProductEntity))
        .thenAnswer((_) async => const Right(testProductEntity));

    //act
    final result = await createProductUsecase(testProductEntity);
    // assert
    expect(result, right(testProductEntity));
  });
}
