import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/create_product_usecase.dart';
import '../../domain/usecases/delete_product_usecase.dart';
import '../../domain/usecases/get_all_products_usecase.dart';
import '../../domain/usecases/get_product_usecase.dart';
import '../../domain/usecases/update_product_usecase.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  //Usecases
  CreateProductUsecase createProductUsecase;
  UpdateProductUsecase updateProductUsecase;
  DeleteProductUsecase deleteProductUsecase;
  GetAllProductUsecase getAllProductUsecase;
  GetProductUsecase    getProductUsecase;
  //Usecases

  ProductBloc(
      {required this.createProductUsecase,
      required this.updateProductUsecase,
      required this.deleteProductUsecase,
      required this.getAllProductUsecase,
      required this.getProductUsecase})
      : super(Empty()) {
    //create product
    on<OnCreateProductEvent>((event, emit) async {
      emit(Loading());
      final result = await createProductUsecase.call(event.productEntity);
      result.fold((Failure failure) {
        emit(CreateProductErrorState(message: failure.message));
      }, (ProductEntity productEntity) {
        emit(CreateProductState(productEntity: productEntity));
      });
    });

    //update product event
    on<OnUpdateProductEvent>((event, emit) async {
      emit(Loading());
      final result = await updateProductUsecase.call(event.productEntity);
      result.fold((Failure failure) {
        emit(UpdateProductErrorState(message: failure.message));
      }, (ProductEntity productEntity) {
        emit(UpdateProductState(productEntity: productEntity));
      });
    });

    //delete product event
    on<OnDeleteProductEvent>((event, emit) async {
      emit(Loading());
      final result = await deleteProductUsecase.call(event.productId);
      result.fold((Failure failure) {
        emit(DeleteProductErrorState(message: failure.message));
      }, (void nothing) {
        emit(DeleteProductState());
      });
    });

    //getAll product event
    on<OnGetAllProductEvent>((event, emit) async {
      emit(Loading());
      final result = await getAllProductUsecase.call();
      result.fold((Failure failure) {
        emit(GetAllProductErrorState(message: failure.message));
      }, (List<ProductEntity> productEntityList) {
        emit(GetAllProductState(productEntityList: productEntityList));
      });
    });

    //get a product event
    on<OnGetProductEvent>((event, emit) async {
      emit(Loading());
      final result = await getProductUsecase.call(event.productId);
      result.fold((Failure failure) {
        emit(GetSingleProductErrorState(message: failure.message));
      }, (ProductEntity productEntity) {
        emit(GetSingleProductState(productEntity: productEntity));
      });
    });
  }
}
