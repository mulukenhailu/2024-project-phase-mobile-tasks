import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
 abstract  class DeleteProductRepository{
  Future<Either<Failure, void>> deleteProduct(int id);
}