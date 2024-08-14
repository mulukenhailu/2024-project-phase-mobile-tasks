import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/delete_product_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../helper/test_helper.mocks.dart';

void main() {
  late DeleteProductUsecase deleteProductUsecase;
  late MockDeleteProductRepository mockDeleteProductRepository;

  setUp(() {
    mockDeleteProductRepository = MockDeleteProductRepository();
    deleteProductUsecase = DeleteProductUsecase(mockDeleteProductRepository);
  });

  const testId = '1';


  test('should delete the product from the respoitory', () async {

    //arrange
    when(mockDeleteProductRepository.deleteProduct(testId))
        .thenAnswer((_) async => const Right(null));

    //act
    final result =  await deleteProductUsecase(testId);

    //assert
    expect(result, const Right(null));
  });
}
