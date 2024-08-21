import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:ecommerce_app/feature/product/presentation/create_product/bloc/create_product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late CreateProductBloc createProductBloc;
  late MockCreateProductUsecase mockCreateProductUsecase;

  setUp(() {
    mockCreateProductUsecase = MockCreateProductUsecase();
    createProductBloc =
        CreateProductBloc(createProductUsecase: mockCreateProductUsecase);
  });

  const testProductModel = ProductModel(
    id: '6672776eb905525c145fe0bb',
    name: 'Anime website',
    description: 'Explore anime characters.',
    price: 123.4,
    imageUrl:
        'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
  );

  const testProductEntity = ProductEntity(
    id: '6672776eb905525c145fe0bb',
    name: 'Anime website',
    description: 'Explore anime characters.',
    price: 123.4,
    imageUrl:
        'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
  );

  test('should set the inintal state to empty', () {
    expect(createProductBloc.state, Empty());
  });

  blocTest<CreateProductBloc, CreateProductState>(
    'should emit [loading, loaded] state if the product is created successully',
    build: () {
      //arrange
      when(mockCreateProductUsecase.call(testProductModel))
          .thenAnswer((_) async => const Right(testProductEntity));
      return createProductBloc;
    },
    act: (bloc) => bloc.add(OnCreateProductEvent(id: testProductModel.id, name: testProductModel.name, description: testProductModel.description, price: testProductModel.price, imageUrl: testProductModel.imageUrl)),
    expect: () => [
      Loading(),
      const Loaded(productEntity: testProductEntity)
    ],
  );
}
