import 'package:boilerplate/models/product/product.dart';

class ProductList {
  final List<Product> products;

  ProductList({
    this.products,
  });

  factory ProductList.fromJson(List<dynamic> json) {
    List<Product> products = List<Product>();
    products = json.map((product) => Product.fromMap(product)).toList();

    return ProductList(
      products: products,
    );
  }
}
