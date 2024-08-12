// Mahros

import 'product.dart';
import 'visitor.dart';

class Website {
  late List<Product> _products = [
    Product(
      name: "Phone",
      discount: 10,
      price: 5000,
      quantity: 100,
    ),
    Product(
      name: "Laptop",
      discount: 5,
      price: 20900,
      quantity: 210,
    ),
  ];
  late List<Visitor> _visitors = [
    Visitor(
      name: "Mahros",
      email: "mahros.elqabasy@hotmail.com",
    ),
    Visitor(
      name: "Ahmed",
      email: "mahmed@hotmail.com",
    ),
    Visitor(
      name: "Mahmoud",
      email: "mahmoud@hotmail.com",
    ),
  ];

  // Constructor
  Website();

  List<Product> getProducts() {
    return this._products;
  }

  List<Visitor> getVisitors() {
    return _visitors;
  }

  // Methods
  void addVisitor(final Visitor visitor) {
    // validate
    _visitors.add(visitor);
  }

  void addProduct(final Product product) {
    // print(_products);
    if (!_products.any((p) => p.getName() == product.getName())) {
      _products.add(product);
    } else {
      print("WARNING: ${product.toString()} Already Exists.");
    }
  }

  void removeProduct(final String name) {
    _products.removeWhere((product) {
      return product.getName() == name;
    });
    print("WARNING: Product(name=$name) is Not Exists");
  }

  // Search
  Product searchProductByName(final String name) {
    return _products.firstWhere(
      (product) => product.getName() == name,
      orElse: () => Product(), // Ensure Product has a default constructor
    );
  }

  void searchProductByPrice(final double price) {
    // Implement this method if needed
  }

  void showProducts() {
    if (_products.isNotEmpty) {
      _products.forEach((product) => print(product.toString()));
    } else {
      print("WARNING: Website Has No Any Product");
    }
  }

  // methods
  Visitor? getVisitor(final String name) {
    for (var item in _visitors) {
      if (item.getName() == name.trim().toLowerCase()) {
        return item;
      }
    }
    return null;
  }

  Product? getProductByName(final String name) {
    for (var item in _products) {
      if (item.getName() == name.trim().toLowerCase()) {
        return item;
      }
    }
    return null; // Ensure Product has a default constructor
  }

  bool isProductExists(final String name) {
    return _products.any((item) => item.getName() == name.trim().toLowerCase());
  }
}

class Result {
  bool isExists = false;
  Visitor visitor = Visitor();

  Result(this.visitor, {this.isExists = false});
}
