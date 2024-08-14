import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../repositories/delete_product_repository.dart';

class DeleteProductUsecase {
  DeleteProductRepository deleteProductRepository;
  DeleteProductUsecase(this.deleteProductRepository);

  Future<Either<Failure, void>> call(String id) async {
    return await deleteProductRepository.deleteProduct(id);
  }
}
