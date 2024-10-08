// product.dart
import '../package.dart';

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
    this._name = name;
    this._price = price;
    this._desc = desc;
    this._discount = discount;
    this._quantity = stock;
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
    if (name != null)
      where = where.where(
        (product) => product.getName().contains(formatText(name)),
      );

    if (desc != null)
      where = where.where(
        (product) => product.getDesc().contains(formatText(desc)),
      );

    if (minPrice != null)
      where = where.where(
        (product) => product.getPrice() >= minPrice,
      );

    if (maxPrice != null)
      where = where.where(
        (product) => product.getPrice() <= maxPrice,
      );

    if (minDiscount != null)
      where = where.where(
        (product) => product.getDiscount() >= minDiscount,
      );

    if (maxDiscount != null)
      where = where.where(
        (product) => product.getDiscount() <= maxDiscount,
      );

    if (minQuantity != null)
      where = where.where(
        (product) => product.getStock() >= minQuantity,
      );

    if (maxQuantity != null)
      where = where.where(
        (product) => product.getStock() <= maxQuantity,
      );

    if (minTotal != null)
      where = where.where(
        (product) => product.totalAfterDiscount() >= minTotal,
      );

    if (maxTotal != null)
      where = where.where(
        (product) => product.totalAfterDiscount() <= maxTotal,
      );
    return (where.length > 0 ? where.toList() : []);
  }

  // Setters
  void setName(final String name) {
    this._name = name.toLowerCase().trim();
  }

  void setDesc(final String desc) {
    this._desc = desc.toLowerCase().trim();
  }

  void setPrice(final double price) {
    if (price > 0) {
      this._price = price;
    } else {
      print("WARNING: PRICE VALUE MUST BE GREATER THAN 0");
    }
  }

  void setDiscount(final double discount) {
    if (discount > 0) {
      this._discount = discount;
    } else {
      print("WARNING: DISCOUNT VALUE MUST BE GREATER THAN 0");
    }
  }

  void setQuantity(final int quantity) {
    if (quantity > 0) {
      this._quantity = quantity;
    } else {
      print("WARNING: QUANTITY VALUE MUST BE GREATER THAN 0");
    }
  }

  // Getters
  String getName() {
    return formatText(this._name);
  }

  String getDesc() {
    return this._desc;
  }

  double getPrice() {
    return this._price;
  }

  double getDiscount() {
    return this._discount;
  }

  int getStock() {
    return this._quantity;
  }

  // Methods
  double totalAfterDiscount() {
    return totalBeforeDiscount() - ((10 * getDiscount()) / 100);
  }

  double totalBeforeDiscount() {
    return getStock() * getPrice();
  }

  void show() {
    print(toJson().toString());
  }

  @override
  String toString() {
    return "Product(name=${getName()}, price=${formatMoney(getPrice())}, stock=${_quantity}, discount=%${getDiscount()}, total=${formatMoney(totalAfterDiscount())})";
  }

  Object toJson() {
    // return "{name:${getName()}, price:${getPrice()}, stock:${getQuantity()}, discount:${getDiscount()}, total:${totalAfterDiscount()}}";
    return {
      "name": getName(),
      "price": getPrice(),
      "stock": getStock(),
      "discount": getDiscount(),
      "totalBeforeDiscount": totalBeforeDiscount(),
      "total": totalAfterDiscount(),
    };
  }
}
