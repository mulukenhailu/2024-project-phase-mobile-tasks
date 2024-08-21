part of 'create_product_bloc.dart';

sealed class CreateProductState extends Equatable {
  const CreateProductState();

  @override
  List<Object> get props => [];
}

final class Empty extends CreateProductState {}

final class Loading extends CreateProductState {}

final class Loaded extends CreateProductState {

  final ProductEntity productEntity;
  const Loaded({required this.productEntity});
   @override
  List<Object> get props => [productEntity];

}

final class Error extends CreateProductState {
  final String message;
  const Error({required this.message});
  @override
  List<Object> get props => [message];
}
