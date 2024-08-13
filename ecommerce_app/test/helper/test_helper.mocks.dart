// Mocks generated by Mockito 5.4.4 from annotations
// in ecommerce_app/test/helper/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:convert' as _i12;
import 'dart:typed_data' as _i14;

import 'package:dartz/dartz.dart' as _i2;
import 'package:ecommerce_app/core/error/failure.dart' as _i6;
import 'package:ecommerce_app/feature/domain/entities/product.dart' as _i7;
import 'package:ecommerce_app/feature/domain/repositories/create_product_repository.dart'
    as _i10;
import 'package:ecommerce_app/feature/domain/repositories/delete_product_repository.dart'
    as _i11;
import 'package:ecommerce_app/feature/domain/repositories/get_all_products_repository.dart'
    as _i8;
import 'package:ecommerce_app/feature/domain/repositories/get_product_repository.dart'
    as _i4;
import 'package:ecommerce_app/feature/domain/repositories/update_product_repository.dart'
    as _i9;
import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i13;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_1 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeStreamedResponse_2 extends _i1.SmartFake
    implements _i3.StreamedResponse {
  _FakeStreamedResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [GetProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProductRepository extends _i1.Mock
    implements _i4.GetProductRepository {
  MockGetProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>> getProduct(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [id],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>>.value(
                _FakeEither_0<_i6.Failure, _i7.ProductEntity>(
          this,
          Invocation.method(
            #getProduct,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>>);
}

/// A class which mocks [GetAllProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetAllProductRepository extends _i1.Mock
    implements _i8.GetAllProductRepository {
  MockGetAllProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, List<_i7.ProductEntity>>>
      getAllProduct() => (super.noSuchMethod(
            Invocation.method(
              #getAllProduct,
              [],
            ),
            returnValue: _i5
                .Future<_i2.Either<_i6.Failure, List<_i7.ProductEntity>>>.value(
                _FakeEither_0<_i6.Failure, List<_i7.ProductEntity>>(
              this,
              Invocation.method(
                #getAllProduct,
                [],
              ),
            )),
          ) as _i5.Future<_i2.Either<_i6.Failure, List<_i7.ProductEntity>>>);
}

/// A class which mocks [UpdateProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateProductRepository extends _i1.Mock
    implements _i9.UpdateProductRepository {
  MockUpdateProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>> updateProduct(
          int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [id],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>>.value(
                _FakeEither_0<_i6.Failure, _i7.ProductEntity>(
          this,
          Invocation.method(
            #updateProduct,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>>);
}

/// A class which mocks [CreateProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockCreateProductRepository extends _i1.Mock
    implements _i10.CreateProductRepository {
  MockCreateProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>> createProduct(
          _i7.ProductEntity? product) =>
      (super.noSuchMethod(
        Invocation.method(
          #createProduct,
          [product],
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>>.value(
                _FakeEither_0<_i6.Failure, _i7.ProductEntity>(
          this,
          Invocation.method(
            #createProduct,
            [product],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i7.ProductEntity>>);
}

/// A class which mocks [DeleteProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteProductRepository extends _i1.Mock
    implements _i11.DeleteProductRepository {
  MockDeleteProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, void>> deleteProduct(int? id) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [id],
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, void>>.value(
            _FakeEither_0<_i6.Failure, void>(
          this,
          Invocation.method(
            #deleteProduct,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, void>>);
}

/// A class which mocks [Client].
///
/// See the documentation for Mockito's code generation for more information.
class MockHTextInputClient extends _i1.Mock implements _i3.Client {
  MockHTextInputClient() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.Response> head(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #head,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #head,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> get(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #get,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #get,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> post(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i12.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #post,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #post,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> put(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i12.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #put,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #put,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> patch(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i12.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #patch,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #patch,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<_i3.Response> delete(
    Uri? url, {
    Map<String, String>? headers,
    Object? body,
    _i12.Encoding? encoding,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #delete,
          [url],
          {
            #headers: headers,
            #body: body,
            #encoding: encoding,
          },
        ),
        returnValue: _i5.Future<_i3.Response>.value(_FakeResponse_1(
          this,
          Invocation.method(
            #delete,
            [url],
            {
              #headers: headers,
              #body: body,
              #encoding: encoding,
            },
          ),
        )),
      ) as _i5.Future<_i3.Response>);

  @override
  _i5.Future<String> read(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #read,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<String>.value(_i13.dummyValue<String>(
          this,
          Invocation.method(
            #read,
            [url],
            {#headers: headers},
          ),
        )),
      ) as _i5.Future<String>);

  @override
  _i5.Future<_i14.Uint8List> readBytes(
    Uri? url, {
    Map<String, String>? headers,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #readBytes,
          [url],
          {#headers: headers},
        ),
        returnValue: _i5.Future<_i14.Uint8List>.value(_i14.Uint8List(0)),
      ) as _i5.Future<_i14.Uint8List>);

  @override
  _i5.Future<_i3.StreamedResponse> send(_i3.BaseRequest? request) =>
      (super.noSuchMethod(
        Invocation.method(
          #send,
          [request],
        ),
        returnValue:
            _i5.Future<_i3.StreamedResponse>.value(_FakeStreamedResponse_2(
          this,
          Invocation.method(
            #send,
            [request],
          ),
        )),
      ) as _i5.Future<_i3.StreamedResponse>);

  @override
  void close() => super.noSuchMethod(
        Invocation.method(
          #close,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
