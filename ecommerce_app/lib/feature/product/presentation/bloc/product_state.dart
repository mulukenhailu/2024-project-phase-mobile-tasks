part of 'product_bloc.dart';

sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}

final class Empty extends ProductState {}

final class Loading extends ProductState {}

//create product
final class CreateProductState extends ProductState {
  final ProductEntity productEntity;
  const CreateProductState({required this.productEntity});
  @override
  List<Object> get props => [productEntity];
}

final class CreateProductErrorState extends ProductState {
  final String message;
  const CreateProductErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

//update product
final class UpdateProductState extends ProductState {
  final ProductEntity productEntity;
  const UpdateProductState({required this.productEntity});
    @override
  List<Object> get props => [productEntity];
}

final class UpdateProductErrorState extends ProductState {
  final String message;
  const UpdateProductErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

//delete  product
final class DeleteProductState extends ProductState {}

final class DeleteProductErrorState extends ProductState {
  final String message;
  const DeleteProductErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

//get all product
final class GetAllProductState extends ProductState {
  final List<ProductEntity> productEntityList;
  const GetAllProductState({required this.productEntityList});
   @override
  List<Object> get props => [productEntityList];
}

final class GetAllProductErrorState extends ProductState {
  final String message;
  const GetAllProductErrorState({required this.message});
  @override
  List<Object> get props => [message];
}

//get a product
final class GetSingleProductState extends ProductState {
  final ProductEntity productEntity;
  const GetSingleProductState({required this.productEntity});
    @override
  List<Object> get props => [productEntity];
}

final class GetSingleProductErrorState extends ProductState {
   final String message;
  const GetSingleProductErrorState({required this.message});
  @override
  List<Object> get props => [message];
}
