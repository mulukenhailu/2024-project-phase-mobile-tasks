import 'dart:io';

class Product {
  String? ProName;
  String? description;
  int? ProPrice;

  Product(String ProName, String description, int ProPrice) {
    this.ProName = ProName;
    this.ProPrice = ProPrice;
    this.description = description;
  }
}

class ProductManagement {
  void addProduct(List<Product> products, Product product) {
    products.add(product);
  }

  bool deletable = false;
  void deleteProduct(List<Product> products, String name) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].ProName == name) {
        products.removeAt(i);
        deletable = true;
        print(">>>>>>>>>>>>>>>>>>>>Product deleted successfully");
        break;
      }
    }
    if (!deletable) {
      print(">>>>>>>>>>>>>>>>>>>>>Product not found");
    }
  }

  //view all products
  void viewProducts(
    List<Product> products,
  ) {
    for (int i = 0; i < products.length; i++) {
      print("Product Name: ${products[i].ProName}");
      print("Product Price: ${products[i].ProPrice}");
      print("Product Description: ${products[i].description}");
    }
  }

  //view product by name
  var found = false;
  void viewProduct(List<Product> products, String name) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].ProName == name) {
        print("..................................");
        print("Product Name: ${products[i].ProName}");
        print("Product Price: ${products[i].ProPrice}");
        print("Product Description: ${products[i].description}");
        found = true;
        break;
      }
    }

    if (!found) {
      print(">>>>>>>>>>>>>>>>>>>>>Product Not Found.");
    }
  }

  //edit product
  bool editable = false;
  void editProduct(List<Product> products, String name, Product product) {
    for (int i = 0; i < products.length; i++) {
      if (products[i].ProName == name) {
        products[i] = product;
        editable = true;
        print(">>>>>>>>>>>>>>>>>>>>Product edited successfully");
        break;
      }
    }
    if (!editable) {
      print(">>>>>>>>>>>>>>>>>>>>>Product not found");
    }
  }
}

void main() {
  //ininialize the list
  List<Product> products = [];

  // add some products to the list
  products.add(Product("Iphone 12", "Apple product", 1000));
  products.add(Product("Samsung S21", "Samsung product", 900));
  products.add(Product("Huawei P40", "Huawei product", 800));

  // create an object of the ProductManagement class
  ProductManagement productManagement = ProductManagement();

  // loop to keep the program running
  while (true) {
    // display the menu
    print("...........................");
    print("1- Add Product");
    print("2- Delete Product");
    print("3- View All Products");
    print("4- View Product");
    print("5- Edit Product");
    print("6- Exit");

    print("Enter your choice: ");

    try {
      int choice = int.parse(stdin.readLineSync()!);

      if (choice == 1) {
        print("Enter Product Name: ");
        String name = stdin.readLineSync()!;
        print("Enter Product Description: ");
        String description = stdin.readLineSync()!;
        print("Enter Product Price: ");
        try {
          int price = int.parse(stdin.readLineSync()!);
          Product product = Product(name, description, price);
          productManagement.addProduct(products, product);
          print(">>>>>>>>>>>>>>>>>>>>>>>>>Product added successfully");
        } catch (e) {
          print(">>>>>>>>>>>>>>>>>>>>>>>>>Invalid price");
          continue;
        }
      } else if (choice == 2) {
        print("Enter Product Name: ");
        String name = stdin.readLineSync()!;
        productManagement.deleteProduct(products, name);
      } else if (choice == 3) {
        productManagement.viewProducts(products);
      } else if (choice == 4) {
        print("Enter Product Name: ");
        String name = stdin.readLineSync()!;
        productManagement.viewProduct(products, name);
      } else if (choice == 5) {
        print("Enter Product Name: ");
        String name = stdin.readLineSync()!;
        print("Enter Product Description: ");
        String description = stdin.readLineSync()!;
        print("Enter Product Price: ");

        try {
          int price = int.parse(stdin.readLineSync()!);
          Product product = Product(name, description, price);
          productManagement.editProduct(products, name, product);
        } catch (e) {
          print(">>>>>>>>>>>>>>>>>>>>>>>>Invalid price");
          continue;
        }
      } else if (choice == 6) {
        break;
      }
    } catch (e) {
      print("Invalid input");
      continue;
    }
  }
}
