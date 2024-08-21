import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/create_product_repository.dart';
import '../datasource/product_local_data_source.dart';
import '../datasource/product_remote_data_source.dart';
import '../models/product_model.dart';

class CreateProductRepositoryImpl implements CreateProductRepository {
  CreateProductRepositoryImpl(
      {required this.remoteDatasource,
      required this.localDataSource,
      required this.networkInfo});
  final ProductRemoteDatasource remoteDatasource;
  final ProductLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, ProductEntity>> createProduct(
      ProductEntity productEntity) async {
    if (await networkInfo.isConnected) {
      try {
        //get the entity and convert it model , pass it to the remote data souce and 
        //convert it back to entity and return it
        final productModel = productEntity.toModel();
        final remoteProduct = await remoteDatasource.createProduct(productModel);
        localDataSource.cacheProduct(productModel);
        return Right(remoteProduct.toEntity());
      } on ServerException {
        return const Left(ServerFailure(message: 'Server Failure'));
      }
    } else {
      try {
        final lastcachedproduct = await localDataSource.getAllCachedProduct();
        return Right(lastcachedproduct.toEntity());
      } on CacheException {
        return const Left(CacheFailure(message: 'cache failure'));
      }
    }
  }
}
