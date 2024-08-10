// Mahros

import 'product/product.dart';

class ShoppingCart {
  late List<Product> _products;

  ShoppingCart();

  // Methods
  bool addProduct(final Product product) {
    this._products.add(product);
    return true;
  }

  bool removeProduct(final String name) {
    this._products.removeWhere((product) => product.getName() == name.trim());
    return true;
  }

  double getTotalPrice() {
    return 0;
  }

  // Display
  void display() {
    print("Your Cart Contains Products:");
    this._products.forEach((product) {});
  }
}
