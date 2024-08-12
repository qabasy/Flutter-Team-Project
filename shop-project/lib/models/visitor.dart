import 'package:shop_project/package/extension.dart';

import 'product.dart';
import 'shopping_cart.dart';

class Visitor {
  late String _name;
  late String _email;
  late ShoppingCart _shoppingCart;

  // Constructor
  Visitor({
    final String name = "default",
    final String email = "default",
    final ShoppingCart? cart,
  }) {
    _name = name;
    _email = email;
    _shoppingCart = cart ?? ShoppingCart([]);
  }

  // Setters
  void setName(final String name) {
    _name = name;
  }

  void setEmail(final String email) {
    _email = email;
  }

  void setProductCart(final Product product) {
    _shoppingCart.addProduct();
  }

  // Getters
  String getName() {
    return _name.toName();
  }

  String getEmail() {
    return _email.toName();
  }

  // ShoppingCart getCart() {
  //   return _shoppingCart;
  // }

  // Methods

  @override
  String toString() {
    return "Visitor(name=${getName()}, inCart=${_shoppingCart.getProducts().length}, total=total)";
  }
}
