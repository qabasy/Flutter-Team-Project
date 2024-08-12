import '../package.dart';

class Product {
  late String _name, _desc;
  late double _price, _discount;
  late int _quantity;

  // Constructor
  Product({
    final String name = "NAME",
    final String desc = "DESC",
    final double price = 0,
    final double discount = 0,
    final int quantity = 0,
  }) {
    this._name = name;
    this._price = price;
    this._desc = desc;
    this._discount = discount;
    this._quantity = quantity; // percentage
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
    return this._name.trim().toLowerCase();
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

  int getQuantity() {
    return this._quantity;
  }

  // Methods
  double total() {
    return calculateDiscount(
      price: this._price,
      quantity: this._quantity,
      discountPercentage: this._discount,
    );
  }

  @override
  String toString() {
    return "Product(name=${getName()}, price=\$${getPrice()}, stock=${_quantity}, discount=%${getDiscount()})";
  }
}
