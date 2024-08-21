import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/update_product_repository.dart';

/// Represents a use case for updating a product.
///
/// This use case is responsible for updating a product in the system.
/// It takes an [UpdateProductRepository] as a dependency to perform the update operation.
///
/// Usage:
/// ```dart
/// final updateProductUsecase = UpdateProductUsecase(updateProductRepository);
/// final result = await updateProductUsecase.call(id);
/// ```
class UpdateProductUsecase {
  UpdateProductRepository updateProductRepository;
  UpdateProductUsecase(this.updateProductRepository);

  Future<Either<Failure, ProductEntity>> call(ProductEntity product) async {
    return await updateProductRepository.updateProduct(product);
  }
}