import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/update_product_repository.dart';
import '../datasource/product_remote_data_source.dart';
import '../models/product_model.dart';

class UpdateProductRepositoryImpl implements UpdateProductRepository {
  UpdateProductRepositoryImpl(
      {required this.remoteDatasource, required this.networkInfo});

  final ProductRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, ProductEntity>> updateProduct(ProductModel product) async {
    if (await networkInfo.isConnected) {
      try {
        final testProductModel = await remoteDatasource.updateProduct(product);
        return Right(testProductModel.toEntity());
      } on ServerException {
        return const Left(ServerFailure(message: 'Server Failure'));
      }
    } else {
      return const Left(SocketFailure(message: 'Socket Failure'));
    }
  }
}
