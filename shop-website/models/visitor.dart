import 'product.dart';
import 'shopping_cart.dart';

class Visitor {
  late String _name;
  late String _email;
  late ShoppingCart _shoppingCart;

  // Constructor
  Visitor({
    final String name = "NAME",
    final String email = "EMAIL",
    final ShoppingCart? cart,
  }) {
    this._name = name;
    this._email = email;
    this._shoppingCart = cart ?? ShoppingCart([]);
  }

  // Methods
  ShoppingCart getShoppingCart() {
    return _shoppingCart;
  }

  void addToCart(final Product product) {
    _shoppingCart.addProduct(product);
  }

  void showCartProducts() {
    _shoppingCart.display();
  }

  // Getters
  String getName() {
    return this._name.trim().toLowerCase();
  }

  @override
  String toString() {
    return "Visitor(name=${getName()}, inCart=${_shoppingCart.getProducts().length}, total=\$${_shoppingCart.getTotalPrice()})";
  }
}
