import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';

abstract class GetProductRepository {
  Future<Either<Failure, ProductEntity>> getProduct(int id);
}
