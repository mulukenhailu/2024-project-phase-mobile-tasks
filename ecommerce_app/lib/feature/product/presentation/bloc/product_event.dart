part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

//create product
class OnCreateProductEvent extends ProductEvent {
  final ProductEntity productEntity;
  const OnCreateProductEvent({required this.productEntity});

  @override
  List<Object> get props => [productEntity];
}

//update product
class OnUpdateProductEvent extends ProductEvent {
  final ProductEntity productEntity;
  const OnUpdateProductEvent({required this.productEntity});

  @override
  List<Object> get props => [productEntity];
}

//delete product
class OnDeleteProductEvent extends ProductEvent {
  final String productId;
  const OnDeleteProductEvent({required this.productId});
  @override
  List<Object> get props => [productId];
}

//get all product
class OnGetAllProductEvent extends ProductEvent {}

//get a product
class OnGetProductEvent extends ProductEvent {
  final String productId;
  const OnGetProductEvent({required this.productId});
   @override
  List<Object> get props => [productId];
}
