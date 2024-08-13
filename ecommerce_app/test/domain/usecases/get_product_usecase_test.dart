import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/domain/entities/product.dart';
import 'package:ecommerce_app/feature/domain/usecases/get_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetProductUsecase getProductUsecase;
  late MockGetProductRepository mockGetProductRepository;

  setUp(() {
    mockGetProductRepository = MockGetProductRepository();
    getProductUsecase = GetProductUsecase(mockGetProductRepository);
  });

  const testId = 1;
  const testProductDetail = ProductEntity(
    id: 1,
    name: 'Bmw',
    description: 'cool car',
    imageUrl: 'some/path',
    price: 2000.00,
  );

  test('should get the current product form the repository',
      //arrange
      () async {
    when(mockGetProductRepository.getProduct(testId))
        .thenAnswer((_) async => const Right(testProductDetail));

    //act
    final result = await getProductUsecase(testId);

    // assert
    expect(result, const Right(testProductDetail));
  });
}
