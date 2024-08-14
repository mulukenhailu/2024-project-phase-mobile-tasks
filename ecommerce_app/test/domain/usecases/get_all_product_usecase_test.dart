import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/get_all_products_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late GetAllProductUsecase getAllProductUsecase;
  late MockGetAllProductRepository mockGetAllProductRepository;

  setUp(() {
    mockGetAllProductRepository = MockGetAllProductRepository();
    getAllProductUsecase = GetAllProductUsecase(mockGetAllProductRepository);
  });

  const List<ProductEntity> testProductDetails = [
    ProductEntity(
        id: 1,
        name: 'Bmw',
        description: 'cool car',
        imageUrl: 'some/path',
        price: 2000.00),
    ProductEntity(
        id: 2,
        name: 'Bmw2',
        description: 'cool car2',
        imageUrl: 'some/path2',
        price: 2000.00)
  ];

  test('should get the current product form the repository',
      //arrange
      () async {
    when(mockGetAllProductRepository.getAllProduct())
        .thenAnswer((_) async => const Right(testProductDetails));

    final result = await getAllProductUsecase();

    expect(result, const Right(testProductDetails));
  });
}
