// product.dart
import 'package:shop_project/package/extension.dart';

class Product {
  late String _name, _desc;
  late double _price, _discount;
  late int _quantity;

  // Constructor
  Product({
    final String name = "default",
    final String desc = "default",
    final double price = 0,
    final double discount = 0,
    final int stock = 0,
  }) {
    _name = name;
    _price = price;
    _desc = desc;
    _discount = discount;
    _quantity = stock;
  }

  // Static
  static List<Product> find(
    final List<Product> products, {
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
    var where = products.where((item) => true);
    if (name != null) {
      where = where.where(
        (product) => product.getName().contains(name.toName()),
      );
    }

    if (desc != null) {
      where = where.where(
        (product) => product.getDesc().contains(desc.toName()),
      );
    }

    if (minPrice != null) {
      where = where.where(
        (product) => product.getPrice() >= minPrice,
      );
    }

    if (maxPrice != null) {
      where = where.where(
        (product) => product.getPrice() <= maxPrice,
      );
    }

    if (minDiscount != null) {
      where = where.where(
        (product) => product.getDiscount() >= minDiscount,
      );
    }

    if (maxDiscount != null) {
      where = where.where(
        (product) => product.getDiscount() <= maxDiscount,
      );
    }

    if (minQuantity != null) {
      where = where.where(
        (product) => product.getStock() >= minQuantity,
      );
    }

    if (maxQuantity != null) {
      where = where.where(
        (product) => product.getStock() <= maxQuantity,
      );
    }

    if (minTotal != null) {
      where = where.where(
        (product) => product.totalAfterDiscount() >= minTotal,
      );
    }

    if (maxTotal != null) {
      where = where.where(
        (product) => product.totalAfterDiscount() <= maxTotal,
      );
    }
    return (where.isNotEmpty ? where.toList() : []);
  }

  // Setters
  void setName(final String name) {
    _name = name.toName();
  }

  void setDesc(final String desc) {
    _desc = desc.toName();
  }

  void setPrice(final double price) {
    if (price > 0) {
      _price = price;
    } else {
      print("WARNING: PRICE VALUE MUST BE GREATER THAN 0");
    }
  }

  void setDiscount(final double discount) {
    if (discount > 0) {
      _discount = discount;
    } else {
      print("WARNING: DISCOUNT VALUE MUST BE GREATER THAN 0");
    }
  }

  void setQuantity(final int quantity) {
    if (quantity > 0) {
      _quantity = quantity;
    } else {
      print("WARNING: QUANTITY VALUE MUST BE GREATER THAN 0");
    }
  }

  // Getters
  String getName() {
    return _name.toName();
  }

  String getDesc() {
    return _desc.toName();
  }

  double getPrice() {
    return _price;
  }

  double getDiscount() {
    return _discount;
  }

  int getStock() {
    return _quantity;
  }

  // Methods
  double totalAfterDiscount() {
    return totalBeforeDiscount() - ((10 * getDiscount()) / 100);
  }

  double totalBeforeDiscount() {
    return getStock() * getPrice();
  }

  void show() {
    print(toString());
  }

  @override
  String toString() {
    return "Product(name=${getName()}, price=${getPrice().toMoney()}, stock=${getStock()}, discount=${getDiscount().toPercentage()}, total=${totalAfterDiscount().toMoney()})";
  }
}
