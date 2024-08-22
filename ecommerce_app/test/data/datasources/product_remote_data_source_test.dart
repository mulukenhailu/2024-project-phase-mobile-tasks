import 'package:ecommerce_app/core/error/exception.dart';
import 'package:ecommerce_app/feature/product/data/datasource/product_remote_data_source_impl.dart';
import 'package:ecommerce_app/feature/product/data/models/product_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http; // Add this line
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
import '../../helper/test_helper.mocks.dart';

void main() {
  late ProductRemoteDataSourceImpl productRemoteDataSourceImpl;
  late MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    productRemoteDataSourceImpl =
        ProductRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  const testId = '1';
  const testProductModel = ProductModel(
      id: '6672776eb905525c145fe0bb',
      name: 'Anime website',
      description: 'Explore anime characters.',
      imageUrl:
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777711/images/clmxnecvavxfvrz9by4w.jpg',
      price: 123);

  //get a product
  group('getProduct', () {
    test('''should perform a Get request to the url 
    with the id being the endpoint and with aplication json header''',
        () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('get_product.json'), 200));
      //act
      productRemoteDataSourceImpl.getProduct(testId);
      //assert
      verify(mockHttpClient.get(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$testId'),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should return ProductModel when the response is 200', () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('get_product.json'), 200));
      //act
      final result = await productRemoteDataSourceImpl.getProduct(testId);
      //assert
      expect(result, equals(testProductModel));
    });

    test('should return ServeException when the response is 404', () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('Something went Wrong', 404));
      //act
      Future<ProductModel> call() =>
          productRemoteDataSourceImpl.getProduct(testId);
      //assert
      expect(call(), throwsA(isA<ServerException>()));
    });
  });

  //delete a product
  group('delete a product', () {
    test(
        'should perfom a Delete request to the url with the product id being the end point and with application json header',
        () {
      //arrange
      when(mockHttpClient.delete(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('delete_product.json'), 200));
      //act
      productRemoteDataSourceImpl.deleteProduct(testId);
      //assert
      verify(mockHttpClient.delete(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$testId'),
          headers: {'Content-Type': 'application/json'}));
    });

    test('should delete a product when the response is 200', () async {
      //arrange
      when(mockHttpClient.delete(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('delete_product.json'), 200));
      //act
      Future<void> call() => productRemoteDataSourceImpl.deleteProduct(testId);

      //assert
      expect(call(), equals(isA<void>()));
    });

    test('should throw ServerException when the resonse is not 204', () async {
      //arrange
      when(mockHttpClient.delete(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('something went wrong', 404));
      //act
      Future<void> call() => productRemoteDataSourceImpl.deleteProduct(testId);

      //assert
      expect(call(), throwsA(isA<ServerException>()));
    });
  });

  //update product

  const testUpdateProductModel = ProductModel(
      id: '6672940692adcb386d593686',
      name: 'TV',
      description: '36\' TV',
      imageUrl:
          'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718785031/images/zqfvuxrxhip7shikyyj4.png',
      price: 123.4);

  group('update product', () {
    test(
        'should perfom a Update request to the url with the product id being the end point and with application json header ',
        () async {
      //arrange
      when(mockHttpClient.put(any,
              headers: anyNamed('headers'),
              body: {'name': 'TV', 'description': '36\' TV', 'price': 123.4}))
          .thenAnswer(
              (_) async => http.Response(fixture('update_product.json'), 200));
      //act
      productRemoteDataSourceImpl.updateProduct(testUpdateProductModel);
      //assert
      verify(mockHttpClient.put(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products/$testUpdateProductModel.id'),
          headers: {'Content-Type': 'application/json'},
          body: {'name': 'TV', 'description': '36\' TV', 'price': 123.4}));
    });

    test('should update the product when the response is 200', () async {
      //arrange
      when(mockHttpClient.put(any,
              headers: anyNamed('headers'),
              body: {'name': 'TV', 'description': '36\' TV', 'price': 123.4}))
          .thenAnswer(
              (_) async => http.Response(fixture('update_product.json'), 200));
      //act
      final result = await productRemoteDataSourceImpl.updateProduct(testUpdateProductModel);
      //assert
      expect(result, equals(testUpdateProductModel));
    });

    test('should throw ServerException when the response is not 200', () async {
      //arrange
      when(mockHttpClient.put(any,
              headers: anyNamed('headers'),
              body: {'name': 'TV', 'description': '36\' TV', 'price': 123.4}))
          .thenAnswer((_) async => http.Response('something went wrong', 404));
      //act
      Future<ProductModel> call() =>
          productRemoteDataSourceImpl.updateProduct(testUpdateProductModel);
      //assert
      expect(call(), throwsA(isA<ServerException>()));
    });
  });



  //get all products
  const testProductModelList = [
    ProductModel(
        id: '6672752cbd218790438efdb0',
        name: 'Anime website',
        description: 'Explore anime characters.',
        imageUrl:
            'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
        price: 123)
  ];
  group('get all products', () {
    test(
        'should make a Get All products request to the url and with application json header',
        () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('get_all_products.json'), 200));
      //act
      productRemoteDataSourceImpl.getAllProduct();
      //assert
      verify(mockHttpClient.get(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
          headers: {'Content-Type': 'application/jdon'}));
    });

    test('should make a Get All products when the reponse is 200', () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
          (_) async => http.Response(fixture('get_all_products.json'), 200));
      //act
      final result = await productRemoteDataSourceImpl.getAllProduct();
      //assert
      expect(result, testProductModelList);
    });

    test('should return ServerException when the reponse is not 200', () async {
      //arrange
      when(mockHttpClient.get(any, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response('something went wrong', 404));
      //act
      Future<List<ProductModel>> call() =>
          productRemoteDataSourceImpl.getAllProduct();
      //assert
      expect(call(), throwsA(isA<ServerException>()));
    });
  });


  //create a product

  const testCreateProductModel = ProductModel(
    id: '66bde8af9bbe07fc39034d13',
    name: 'PC',
    description: 'long description',
    price: 123.4,
    imageUrl:
        'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723721903/images/ldbvucbl012gy90gsuam.png',
  );
  group('create a product', () {
    test(
        'should make a post request to the url and with application json header',
        () async {
      //arrange
      when(mockHttpClient.post(any, headers: anyNamed('headers'), body: {
        'id': '66bde8af9bbe07fc39034d13',
        'name': 'PC',
        'description': 'long description',
        'imageUrl':
            'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723721903/images/ldbvucbl012gy90gsuam.png',
        'price': 123.4
      })).thenAnswer(
          (_) async => http.Response(fixture('create_product.json'), 200));
      //act
      productRemoteDataSourceImpl.createProduct(testCreateProductModel);
      //assert
      verify(mockHttpClient.post(
          Uri.parse(
              'https://g5-flutter-learning-path-be.onrender.com/api/v2/products'),
          headers: {
            'Content-Type': 'application/json'
          },
          body: {
            'id': '66bde8af9bbe07fc39034d13',
            'name': 'PC',
            'description': 'long description',
            'imageUrl':
                'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723721903/images/ldbvucbl012gy90gsuam.png',
            'price': 123.4
          }));
    });

    test('should post the ProductModel when the status code is 200', () async {
      //arrange
      when(mockHttpClient.post(any, headers: anyNamed('headers'), body: {
        'id': '66bde8af9bbe07fc39034d13',
        'name': 'PC',
        'description': 'long description',
        'imageUrl':
            'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723721903/images/ldbvucbl012gy90gsuam.png',
        'price': 123.4
      })).thenAnswer(
          (_) async => http.Response(fixture('create_product.json'), 200));
      //act
      final result = await productRemoteDataSourceImpl
          .createProduct(testCreateProductModel);
      //assert
      expect(result, testCreateProductModel);
    });


    test('should throw ServerException when the status code is not 200', () async {
      //arrange
      when(mockHttpClient.post(any, headers: anyNamed('headers'), body: {
        'id': '66bde8af9bbe07fc39034d13',
        'name': 'PC',
        'description': 'long description',
        'imageUrl':
            'https://res.cloudinary.com/g5-mobile-track/image/upload/v1723721903/images/ldbvucbl012gy90gsuam.png',
        'price': 123.4
      })).thenAnswer(
          (_) async => http.Response('something went wrong', 404));
      //act
      Future<ProductModel> call() => productRemoteDataSourceImpl
          .createProduct(testCreateProductModel);
      //assert
      expect(call(), throwsA(isA<ServerException>()));
    });
  });
}
