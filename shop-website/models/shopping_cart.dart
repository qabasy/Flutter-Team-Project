// Mahros

import 'product.dart';

class ShoppingCart {
  late List<Product> _products = [];

  ShoppingCart(final List<Product> products);

  // Getters
  List<Product> getProducts() {
    return _products;
  }

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
    double total = 0;
    _products.forEach((product) {
      total += product.total();
    });
    return total;
  }

  double getTotalAfterDiscount() {
    double total = 0;
    _products.forEach((product) {
      total += product.total();
    });
    return total;
  }

  // Display
  void display() {
    print("Your Cart Contains Products:");
    this._products.forEach((product) {
      print(product.toString());
    });
  }
}
