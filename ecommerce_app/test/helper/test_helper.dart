
import 'package:ecommerce_app/feature/domain/repositories/create_product_repository.dart';
import 'package:ecommerce_app/feature/domain/repositories/delete_product_repository.dart';
import 'package:ecommerce_app/feature/domain/repositories/get_all_products_repository.dart';
import 'package:ecommerce_app/feature/domain/repositories/get_product_repository.dart';
import 'package:ecommerce_app/feature/domain/repositories/update_product_repository.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';


@GenerateMocks(
  [
    GetProductRepository,
    GetAllProductRepository,
    UpdateProductRepository,
    CreateProductRepository,
    DeleteProductRepository
    
  ],
  customMocks: [MockSpec<http.Client>(as :#MockHTextInputClient)]
)

void main(){}

