// shopping_cart.dart
import '../package.dart';
import 'product.dart';

class ShoppingCart {
  late List<Product> _products;

  ShoppingCart({final List<Product>? products}) {
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
  bool addProduct(final Product product) {
    if (!_products.contains(
        _products.where((item) => item.getName() == product.getName()))) {
      _products.add(product);
      return true;
    }
    return false;
  }

  bool removeProduct(final String name) {
    this._products.removeWhere(
        (product) => product.getName() == name.trim().toLowerCase());
    return true;
  }

  Product? findProduct(final String name) {
    Iterable<Product> where = _products
        .where((item) => item.getName().contains(name.trim().toLowerCase()));
    return (where.length > 0 ? where.first : null);
  }

  // double getTotalPrice() {
  //   double total = 0;
  //   _products.forEach((product) {
  //     total += product.total();
  //   });
  //   return total;
  // }

  // double getTotalAfterDiscount() {
  //   double total = 0;
  //   _products.forEach((product) {
  //     total += product.total();
  //   });
  //   return total;
  // }

  // Display
  @override
  String toString() {
    return "ShoppingCart()";
  }
}


/*


  List<Product> find({
    final String? name,
    final String? desc,
    final double? minPrice,
    final double? maxPrice,
    final double? minDiscount,
    final double? maxDiscount,
    final int? minQuantity,
    final int? maxQuantity,
    final double? minTotal,
    final double? maxTotal,
  }) {
    // var query = 0;
    var where = _products;
    if (name != null)
      where.where(
        (product) => product.getName().contains(formatText(name)),
      );

    if (desc != null)
      where.where(
        (product) => product.getDesc().contains(formatText(desc)),
      );

    if (minPrice != null)
      where.where(
        (product) => product.getPrice() >= minPrice,
      );

    if (maxPrice != null)
      where.where(
        (product) => product.getPrice() <= maxPrice,
      );

    if (minDiscount != null)
      where.where(
        (product) => product.getDiscount() >= minDiscount,
      );

    if (maxDiscount != null)
      where.where(
        (product) => product.getDiscount() <= maxDiscount,
      );

    if (minQuantity != null)
      where.where(
        (product) => product.getStock() >= minQuantity,
      );

    if (maxQuantity != null)
      where.where(
        (product) => product.getStock() <= maxQuantity,
      );

    if (minTotal != null)
      where.where(
        (product) => product.totalAfterDiscount() >= minTotal,
      );

    if (maxTotal != null)
      where.where(
        (product) => product.totalAfterDiscount() <= maxTotal,
      );
    return (where.length > 0 ? where.toList() : []);
  }
*/