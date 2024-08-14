import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/product.dart';
import '../repositories/get_product_repository.dart';

/// A use case class for getting a product.
///
/// This class is responsible for retrieving a product from the repository.
/// It takes an instance of [GetProductRepository] as a parameter in the constructor.
/// The [call] method is used to retrieve a product by its ID.
/// It returns a [Future] that resolves to an [Either] object, which can contain either a [Failure] or a [ProductEntity].
class GetProductUsecase {
  GetProductUsecase(this.getProductRepository);
  final GetProductRepository getProductRepository;

  Future<Either<Failure, ProductEntity>> call(String id) async {
    return await getProductRepository.getProduct(id);
  }
}