import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/network_info.dart';
import '../feature/product/data/datasource/product_local_data_source.dart';
import '../feature/product/data/datasource/product_remote_data_source.dart';
import '../feature/product/data/datasource/product_remote_data_source_impl.dart';
import '../feature/product/data/repositories/create_product_repository_impl.dart';
import '../feature/product/data/repositories/delete_product_repository_impl.dart';
import '../feature/product/data/repositories/get_all_products_repository_impl.dart';
import '../feature/product/data/repositories/get_product_repository_impl.dart';
import '../feature/product/data/repositories/update_product_repository_impl.dart';
import '../feature/product/domain/repositories/create_product_repository.dart';
import '../feature/product/domain/repositories/delete_product_repository.dart';
import '../feature/product/domain/repositories/get_all_products_repository.dart';
import '../feature/product/domain/repositories/get_product_repository.dart';
import '../feature/product/domain/repositories/update_product_repository.dart';
import '../feature/product/domain/usecases/create_product_usecase.dart';
import '../feature/product/domain/usecases/delete_product_usecase.dart';
import '../feature/product/domain/usecases/get_all_products_usecase.dart';
import '../feature/product/domain/usecases/get_product_usecase.dart';
import '../feature/product/domain/usecases/update_product_usecase.dart';
import '../feature/product/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance; //sl--> service locator
  Future<void> init() async {
  //! feature - Product
  //Bloc
  sl.registerFactory(() => ProductBloc(
      createProductUsecase: sl(),
      updateProductUsecase: sl(),
      deleteProductUsecase: sl(),
      getAllProductUsecase: sl(),
      getProductUsecase: sl()));

  //Usecase
  sl.registerLazySingleton(() => CreateProductUsecase(sl()));
  sl.registerLazySingleton(() => UpdateProductUsecase(sl()));
  sl.registerLazySingleton(() => DeleteProductUsecase(sl()));
  sl.registerLazySingleton(() => GetAllProductUsecase(sl()));
  sl.registerLazySingleton(() => GetProductUsecase(sl()));

  //Repository
  //create product repository
  sl.registerLazySingleton<CreateProductRepository>(() =>
      CreateProductRepositoryImpl(
          remoteDatasource: sl(), localDataSource: sl(), networkInfo: sl()));

  //update product repository
  sl.registerLazySingleton<UpdateProductRepository>(() =>
      UpdateProductRepositoryImpl(remoteDatasource: sl(), networkInfo: sl()));

  //delete product repository
  sl.registerLazySingleton<DeleteProductRepository>(() =>
      DeleteProductRepositoryImpl(remoteDatasource: sl(), networkInfo: sl()));

  //get all product repository
  sl.registerLazySingleton<GetAllProductRepository>(() =>
      GetAllProductsRepositoryImpl(remoteDatasource: sl(), networkInfo: sl()));

  //get a product repository
  sl.registerLazySingleton<GetProductRepository>(() =>
      GetProductRepositoryImpl(remoteDatasource: sl(), networkInfo: sl()));

  //Data source
  //remote data source
  sl.registerLazySingleton<ProductRemoteDatasource>(
      () => ProductRemoteDataSourceImpl(httpClient: sl()));

  //local data source
  sl.registerLazySingleton<ProductLocalDataSource>(
      () => ProductLocalDataSourceImpl(sharedPreferences: sl()));

  //!Core
  //network
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //!External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
