
import 'package:ecommerce_app/core/platform/network_info.dart';
import 'package:ecommerce_app/feature/product/data/datasource/product_local_data_source.dart';
import 'package:ecommerce_app/feature/product/data/datasource/product_remote_data_source.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/create_product_repository.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/delete_product_repository.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/get_all_products_repository.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/get_product_repository.dart';
import 'package:ecommerce_app/feature/product/domain/repositories/update_product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';


@GenerateMocks(
  [
    GetProductRepository,
    GetAllProductRepository,
    UpdateProductRepository,
    CreateProductRepository,
    DeleteProductRepository,
    ProductRemoteDatasource,
    ProductLocalDataSource,
    NetworkInfo
    
  ],
  customMocks: [MockSpec<http.Client>(as :#MockHTextInputClient)]
)

void main(){}

