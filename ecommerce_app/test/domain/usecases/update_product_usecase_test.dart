import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/update_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late MockUpdateProductRepository mockUpdateProductRepository;
  late UpdateProductUsecase updateProductUsecase;

  setUp(() {
    mockUpdateProductRepository = MockUpdateProductRepository();
    updateProductUsecase = UpdateProductUsecase(mockUpdateProductRepository);
  });

  const testProductEntity = ProductEntity(
      id: '1',
      name: 'Toyota',
      description: 'Durable',
      imageUrl: 'path/to/image',
      price: 1500.00);

  const testProductModel = ProductModel(
      id: '1',
      name: 'Toyota',
      description: 'Durable',
      imageUrl: 'path/to/image',
      price: 1500.00);
  test('should update the product from the respository', () async {
    //arrange
    when(mockUpdateProductRepository.updateProduct(testProductEntity))
        .thenAnswer((_) async => const Right(testProductEntity));

    // act
    final result = await updateProductUsecase(testProductEntity);

    // assert
    expect(result, const Right(testProductEntity));
  });
}
