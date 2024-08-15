import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/create_product_repository.dart';
import '../datasource/product_local_data_source.dart';
import '../datasource/product_remote_data_source.dart';
import '../models/product_model.dart';

class CreateProductRepositoryImpl extends CreateProductRepository {
  CreateProductRepositoryImpl(
      {required this.remoteDatasource,
      required this.localDataSource,
      required this.networkInfo});
  final ProductRemoteDatasource remoteDatasource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, ProductEntity>> createProduct(ProductModel product) {
    // TODO: implement createProduct
    networkInfo.isConnected;

    return Future.value(Right(product.toEntity()));
  }
}
