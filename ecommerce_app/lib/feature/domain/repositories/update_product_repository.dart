import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class UpdateProductRepository {
  Future<Either<Failure, ProductEntity>> updateProduct(int id);
}
