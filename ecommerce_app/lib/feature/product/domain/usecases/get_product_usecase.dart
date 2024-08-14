import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/get_product_repository.dart';

class GetProductUsecase {
  GetProductUsecase(this.getProductRepository);
  final GetProductRepository getProductRepository;

 Future<Either<Failure, ProductEntity>> call(int id) async{
    return await getProductRepository.getProduct(id);
  }
}
