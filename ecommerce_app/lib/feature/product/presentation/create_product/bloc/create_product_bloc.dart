import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/error/failure.dart';
import '../../../data/models/product_model.dart';
import '../../../domain/entities/product.dart';
import '../../../domain/usecases/create_product_usecase.dart';

part 'create_product_event.dart';
part 'create_product_state.dart';

class CreateProductBloc extends Bloc<CreateProductEvent, CreateProductState> {
  CreateProductUsecase createProductUsecase;
  CreateProductBloc({required this.createProductUsecase}) : super(Empty()) {
    on<OnCreateProductEvent>((event, emit) async {
      //inintal state
      emit(Loading());

      //create the product model from the event params
      ProductModel productModel = ProductModel(
          id: event.id,
          name: event.name,
          description: event.description,
          imageUrl: event.imageUrl,
          price: event.price);

      // try to create the product
      final result = await createProductUsecase.call(productModel);

      // handle the response goten
      result.fold(
        //failure returned
      (Failure failure) {
        emit(const Error(message: 'something went wrong'));
      }, 
      // product created successfully
      (ProductEntity productEntity) {
        emit(Loaded(productEntity: productEntity));
        
      });
    });
  }
}
