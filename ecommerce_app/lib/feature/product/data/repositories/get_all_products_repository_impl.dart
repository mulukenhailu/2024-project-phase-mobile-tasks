import 'package:dartz/dartz.dart';

import '../../../../core/error/exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/get_all_products_repository.dart';
import '../datasource/product_remote_data_source.dart';

class GetAllProductsRepositoryImpl implements GetAllProductRepository {
  GetAllProductsRepositoryImpl(
      {required this.remoteDatasource, required this.networkInfo});

  final ProductRemoteDatasource remoteDatasource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProduct() async {
    networkInfo.isConnected;
    try {
      final result = await remoteDatasource.getAllProduct();
      final productEntityList = result.map((productModel) => productModel.toEntity()).toList();
      return Right(productEntityList);
    } on ServerException {
     return const Left(ServerFailure(message: 'Server Failure'));
    }
  }
}
