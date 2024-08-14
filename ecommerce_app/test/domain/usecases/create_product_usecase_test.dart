import 'package:dartz/dartz.dart';
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

  const testProduct = ProductEntity(
      id: 1,
      name: 'suzuki',
      description: 'norma',
      imageUrl: 'path/to/suzuki',
      price: 1000.00);

  test('should create product from the respository', () async {

    //arrange
    when(mockCreateProductRepository.createProduct(testProduct))
        .thenAnswer((_) async => const Right(testProduct));

    //act
    final result = await createProductUsecase(testProduct);
    // assert
    expect(result, right(testProduct));
  });
}
