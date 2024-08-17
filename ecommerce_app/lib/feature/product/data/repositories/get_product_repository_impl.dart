import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/get_product_repository.dart';
import '../datasource/product_remote_data_source.dart';

class GetProductRepositoryImpl implements GetProductRepository {
  GetProductRepositoryImpl(
      {required this.remoteDatasource,
      required this.networkInfo});

  final ProductRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, ProductEntity>> getProduct(String id) async {
    networkInfo.isConnected;
    try {
      final productModel = await remoteDatasource.getProduct(id);
      return Right(productModel.toEntity());
    } on ServerException {
      return const Left(ServerFailure(message: 'Server Failure'));
    } on SocketException{
      return const Left(SocketFailure(message: 'Server Failure'));
    }
  }
}
