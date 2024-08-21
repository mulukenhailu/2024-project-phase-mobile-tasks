import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/error/failure.dart';
import 'package:ecommerce_app/feature/product/domain/entities/product.dart';
import 'package:ecommerce_app/feature/product/presentation/bloc/product_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late ProductBloc productBloc;
  late MockCreateProductUsecase mockCreateProductUsecase;
  late MockUpdateProductUsecase mockUpdateProductUsecase;
  late MockDeleteProductUsecase mockDeleteProductUsecase;
  late MockGetAllProductUsecase mockGetAllProductUsecase;
  late MockGetProductUsecase mockGetProductUsecase;

  setUp(() {
    mockCreateProductUsecase = MockCreateProductUsecase();
    mockUpdateProductUsecase = MockUpdateProductUsecase();
    mockDeleteProductUsecase = MockDeleteProductUsecase();
    mockGetAllProductUsecase = MockGetAllProductUsecase();
    mockGetProductUsecase = MockGetProductUsecase();

    productBloc = ProductBloc(
        createProductUsecase: mockCreateProductUsecase,
        updateProductUsecase: mockUpdateProductUsecase,
        deleteProductUsecase: mockDeleteProductUsecase,
        getAllProductUsecase: mockGetAllProductUsecase,
        getProductUsecase: mockGetProductUsecase);
  });

  const testProductEntity = ProductEntity(
    id: '6672776eb905525c145fe0bb',
    name: 'Anime website',
    description: 'Explore anime characters.',
    price: 123.4,
    imageUrl:
        'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
  );

  const testProductEntityList = [
    ProductEntity(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      price: 123.4,
      imageUrl:
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
    ),
  ];

  group('create product bloc', () {
    test('should set the inintal state to empty', () {
      expect(productBloc.state, Empty());
    });

    blocTest<ProductBloc, ProductState>(
      'should emit [loading, CreateProductState] state if the product is created successully',
      build: () {
        when(mockCreateProductUsecase.call(testProductEntity))
            .thenAnswer((_) async => const Right(testProductEntity));
        return productBloc;
      },
      act: (bloc) => bloc
          .add(const OnCreateProductEvent(productEntity: testProductEntity)),
      expect: () => [
        Loading(),
        const CreateProductState(productEntity: testProductEntity)
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'should emit [loading, CreateProductErrorState] state if the product is created unsuccessully',
      build: () {
        when(mockCreateProductUsecase.call(testProductEntity)).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'server failure')));
        return productBloc;
      },
      act: (bloc) => bloc
          .add(const OnCreateProductEvent(productEntity: testProductEntity)),
      expect: () =>
          [Loading(), const CreateProductErrorState(message: 'server failure')],
    );
  });

  group('update product bloc', () {
    test('should set the inintal state to empty', () async {
      expect(productBloc.state, Empty());
    });

    blocTest<ProductBloc, ProductState>(
        'should emit [loading, UpdateProductState] if the product is updated successfully',
        build: () {
          when(mockUpdateProductUsecase.call(testProductEntity))
              .thenAnswer((_) async => const Right(testProductEntity));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(const OnUpdateProductEvent(productEntity: testProductEntity)),
        expect: () => [
              Loading(),
              const UpdateProductState(productEntity: testProductEntity)
            ]);

    blocTest<ProductBloc, ProductState>(
        'should emit [loading, UpdateProductErrorState] if the product is not updated',
        build: () {
          when(mockUpdateProductUsecase.call(testProductEntity)).thenAnswer(
              (_) async =>
                  const Left(ServerFailure(message: 'server failure')));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(const OnUpdateProductEvent(productEntity: testProductEntity)),
        expect: () => [
              Loading(),
              const UpdateProductErrorState(message: 'server failure')
            ]);
  });

  const testId = '1';

  group('delete a product', () {
    test('should set the inintal state to empty', () async {
      expect(productBloc.state, Empty());
    });

    blocTest<ProductBloc, ProductState>(
      'should emit [loadig, DeleteProductState] if deleting a product is successful.',
      build: () {
        when(mockDeleteProductUsecase.call(testId))
            .thenAnswer((_) async => const Right(null));
        return productBloc;
      },
      act: (bloc) => bloc.add(const OnDeleteProductEvent(productId: testId)),
      expect: () => [Loading(), DeleteProductState()],
    );

    blocTest<ProductBloc, ProductState>(
      'should emit [loadig, DeleteProductErrorState] if deleting a product is not successful.',
      build: () {
        when(mockDeleteProductUsecase.call(testId)).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'server failure')));
        return productBloc;
      },
      act: (bloc) => bloc.add(const OnDeleteProductEvent(productId: testId)),
      expect: () =>
          [Loading(), const DeleteProductErrorState(message: 'server failure')],
    );
  });

  group('get all products', () {
    test('should set the inintal state to empty', () async {
      expect(productBloc.state, Empty());
    });

    blocTest<ProductBloc, ProductState>(
      'should emit[Loading, GetAllProductState] if the getting all the product is successful',
      build: () {
        when(mockGetAllProductUsecase.call())
            .thenAnswer((_) async => const Right(testProductEntityList));
        return productBloc;
      },
      act: (bloc) => bloc.add(OnGetAllProductEvent()),
      expect: () => [
        Loading(),
        const GetAllProductState(productEntityList: testProductEntityList)
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'should emit[Loading, GetAllProductErrorState] if getting all the product is unsuccessful',
      build: () {
        when(mockGetAllProductUsecase.call()).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'server failure')));
        return productBloc;
      },
      act: (bloc) => bloc.add(OnGetAllProductEvent()),
      expect: () =>
          [Loading(), const GetAllProductErrorState(message: 'server failure')],
    );
  });

  group('get a product', () {
    test('should set the inintal state to empty', () async {
      expect(productBloc.state, Empty());
    });

    blocTest<ProductBloc, ProductState>(
      'emits [loading, GetSingleProductState] if getting a product is successful',
      build: () {
        when(mockGetProductUsecase.call(testId))
            .thenAnswer((_) async => const Right(testProductEntity));
        return productBloc;
      },
      act: (bloc) => bloc.add(const OnGetProductEvent(productId:testId)),
      expect: () => [
        Loading(),
        const GetSingleProductState(productEntity:testProductEntity)
      ],
    );

     blocTest<ProductBloc, ProductState>(
      'emits [loading, GetSingleProductErrorState] if getting a product is not successful.',
      build: () {
        when(mockGetProductUsecase.call(testId))
            .thenAnswer((_) async => const Left(ServerFailure(message: 'server failure')));
        return productBloc;
      },
      act: (bloc) => bloc.add(const OnGetProductEvent(productId:testId)),
      expect: () => [
        Loading(),
        const GetSingleProductErrorState(message: 'server failure')
      ],
    );
  });
}
