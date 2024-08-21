import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/create_product_repository.dart';

class CreateProductUsecase {
  CreateProductRepository  createProductRepository;
  CreateProductUsecase(this.createProductRepository);

  Future<Either<Failure, ProductEntity>> call(ProductEntity product) async {
    return await createProductRepository.createProduct(product);
  }
}
