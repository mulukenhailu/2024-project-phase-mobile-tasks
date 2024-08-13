import 'package:dartz/dartz.dart';
import '../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/get_all_products_repository.dart';

class GetAllProductUsecase {
  GetAllProductUsecase(this.getAllProductRepository);
  final GetAllProductRepository getAllProductRepository;

 Future<Either<Failure, List<ProductEntity>>> call() async{
    return await getAllProductRepository.getAllProduct();
  }
}
