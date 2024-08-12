// shopping_cart.dart

import 'package:shop_project/package/extension.dart';
import 'package:shop_project/package/package.dart';

import 'product.dart';

class ShoppingCart {
  late List<Product> _products;

  ShoppingCart(List list, {final List<Product>? products}) {
    _products = products ?? [];
  }

  // Setters
  bool setProducts(final List<Product> products) {
    _products = products;
    return true;
  }

  // Getters
  List<Product> getProducts() {
    return _products;
  }

  // Methods
  bool addProduct(final List<Product> products) {
    print("Adding New Product");

    // Check if product exists in website
    String name = input("Product Name: ");
    var where = products.where((item) => item.getName() == name.toName());

    if (where.isNotEmpty) {
      print("GOOD: Product Exists In Our Website");
      _products.add(where.first);
      print("SUCCESS: Product Added to Cart Successfully");
      return true;
    } else {
      print("WARNING: Product(name=$name) is Not exists in Website");
      return false;
    }
  }

  bool removeProduct(final String name) {
    var where = _products.where((item) => item.getName() == name.toName());
    if (where.isNotEmpty) {
      _products.removeWhere((product) => product.getName() == name.toName());
      print("SUCCESS: Product(name=$name) Has Been Removed Successfully");
      return true;
    } else {
      return false;
    }
  }

  double totalBeforeDiscount() {
    double total = 0;
    for (var product in _products) {
      total += product.totalBeforeDiscount();
    }
    return total;
  }

  double totalAfterDiscount() {
    double total = 0;
    for (var product in _products) {
      total += product.totalAfterDiscount();
    }
    return total;
  }

  // Display
  @override
  String toString() {
    return "ShoppingCart(inStock=${getProducts().length}, totalBefore=${totalBeforeDiscount().toMoney()}, totalAfter=${totalAfterDiscount().toMoney()})";
  }
}
