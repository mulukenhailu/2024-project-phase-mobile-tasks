import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/update_product_repository.dart';

class UpdateProductUsecase {
  UpdateProductRepository updateProductRepository;
  UpdateProductUsecase(this.updateProductRepository);

  Future<Either<Failure, ProductEntity>> call(int id) async {
    return await updateProductRepository.updateProduct(id);
  }
}
