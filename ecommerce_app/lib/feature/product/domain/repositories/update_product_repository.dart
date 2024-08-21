import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../data/models/product_model.dart';
import '../entities/product.dart';

abstract class UpdateProductRepository {
  Future<Either<Failure, ProductEntity>> updateProduct(ProductModel product);
}
