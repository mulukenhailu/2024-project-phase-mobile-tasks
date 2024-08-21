
import 'package:ecommerce_app/core/network/network_info.dart';
import 'package:ecommerce_app/feature/product/data/datasource/product_local_data_source.dart';
import 'package:ecommerce_app/feature/product/data/datasource/product_remote_data_source.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/create_product_repository.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/delete_product_repository.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/get_all_products_repository.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/get_product_repository.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/update_product_repository.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/create_product_usecase.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/delete_product_usecase.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/get_all_products_usecase.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/get_product_usecase.dart';
import 'package:ecommerce_app/feature/product/domain/usecases/update_product_usecase.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart' as prefix;
import 'package:mockito/annotations.dart';



import 'package:shared_preferences/shared_preferences.dart';

@GenerateMocks(
  [
    CreateProductUsecase,
    UpdateProductUsecase,
    DeleteProductUsecase,
    GetAllProductUsecase,
    GetProductUsecase,
    GetProductRepository,
    GetAllProductRepository,
    UpdateProductRepository,
    CreateProductRepository,
    DeleteProductRepository,
    ProductRemoteDatasource,
    ProductLocalDataSource,
    NetworkInfo,
    prefix.InternetConnectionChecker,
    SharedPreferences,
    // http.Client 
    
  ],
  customMocks: [MockSpec<http.Client>(as :#MockHttpClient)]
)

void main(){}

