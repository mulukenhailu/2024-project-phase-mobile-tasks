part of 'update_product_bloc.dart';

sealed class UpdateProductState extends Equatable {
  const UpdateProductState();
  
  @override
  List<Object> get props => [];
}

final class UpdateProductInitial extends UpdateProductState {}
