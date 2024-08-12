import 'models/product.dart';
import 'models/shopping_cart.dart';

void main(List<String> args) {
  ShoppingCart sc = ShoppingCart();
  sc.addProduct(Product(
    name: "Product 2",
    price: 1500,
    stock: 20,
    desc: "Description",
    discount: 10,
  ));
  sc.addProduct(
    Product(
      name: "Test2",
      price: 1050,
      stock: 200,
      desc: "Description",
      discount: 50,
    ),
  );
  sc.addProduct(
    Product(
      name: "Oppo A1K",
      price: 152454,
      stock: 150,
      desc: "Description",
      discount: 115,
    ),
  );
  sc.addProduct(
    Product(
      name: "Samsoung Galaxy",
      price: 360,
      stock: 10,
      desc: "Descrio",
      discount: 90,
    ),
  );
  print(
    Product.find(sc.getProducts(), minPrice: 0, name: "sam")
        .toString()
        .replaceAll("),", ")\n"),
  );
  // print(Product.find(minPrice: 150000, max).toString().replaceAll("),", ")\n"));
  // print(Product.find(minPrice: 150000, max).toString().replaceAll("),", ")\n"));
}

// import 'package:cli_table/cli_table.dart';

// void main() {
//   // Define the data
//   List<Map<String, String>> data = [
//     {'Name': 'Alice', 'Age': '30', 'City': 'New York'},
//     {'Name': 'Bob', 'Age': '25', 'City': 'Los Angeles'},
//     {'Name': 'Charlie', 'Age': '35', 'City': 'Chicago'},
//   ];

//   // Create the table
//   var table = Table(
//     header: ['Name', 'Age', 'City'],
//     rows: data.map((row) => [row['Name'], row['Age'], row['City']]).toList(),
//   );

//   // Print the table
//   print(table);
// }
