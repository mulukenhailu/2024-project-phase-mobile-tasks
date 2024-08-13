import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class GetAllProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProduct();
}
