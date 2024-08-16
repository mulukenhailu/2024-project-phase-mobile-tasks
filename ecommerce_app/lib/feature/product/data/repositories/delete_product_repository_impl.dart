import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/delete_product_repository.dart';
import '../datasource/product_remote_data_source.dart';

class DeleteProductRepositoryImpl implements DeleteProductRepository {
  DeleteProductRepositoryImpl(
      {required this.remoteDatasource, required this.networkInfo});

  final ProductRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, void>> deleteProduct(String id) async {
    networkInfo.isConnected;
    try {
      remoteDatasource.deleteProduct(id);
      return const Right(null);
    } on ServerException {
      return const Left(ServerFailure(message: 'server failure'));
    }
  }
}
