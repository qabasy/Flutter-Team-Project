import 'App.dart';
import 'models/product.dart';
import 'models/visitor.dart';
import 'models/website.dart';

void main() {
  try {
    ShoppingWebsite("Shopping Website", prompt: "Shopping Website> ").run();
  } catch (error) {
    print(error);
    main();
  }
}

class ShoppingWebsite extends App {
  final Website _website = Website();

  // Constructor
  ShoppingWebsite(final String name, {final String prompt = "Application> "})
      : super(name, prompt: prompt);

  // void showVisitors(){
  //   _website.getVisitors()
  // }
  @override
  void run() {
    handleCommands();
    clear();
    welcome();
    menu();
    print("Products Menu: ");
    _website.showProducts();

    showVisitors();
    print("");
    while (this.getRunning()) {
      this.setInput(input("${this.getPrompt()}").trim().toLowerCase());
      switch (this.getInput()) {
        case "start" || "st" || "s":
          this.run();
          break;
        case "clear" || "cls" || "c":
          this.clear();
          break;
        case "exit" || "ex" || "x":
          this.exit();
          break;
        case "add.visitor" || "av":
          addVisitor();
        case "add.to.visitor.cart" || "avc":
          addProductToVisitorCart();
          break;
        case "add.product" || "ap":
          addProduct();
          break;
        case "remove.product" || "rp":
          removeProduct();
          break;
        case "search.by.name" || "sbn":
          searchByName();
          break;
        case "search.by.price" || "sbp":
          searchByPrice();
          break;
        case "show.visitors" || "sv":
          showVisitors();
          break;
        case "show.website.products" || "swp":
          showWebsiteProducts();
          break;
        case "show.visitor.products" || "svp":
          showVisitorProducts();
          break;
      }
    }
  }

  void showVisitors() {
    print("\nShowing Visitors: ");
    if (_website.getVisitors().length > 0) {
      _website.getVisitors().forEach((item) {
        print(item.toString());
      });
    } else {
      print("WARNING: Sorry there is no any visitor");
    }
  }

  void addVisitor() {
    print("\nAdding New Visitor");
    Visitor visitor = Visitor(
      name: input("Name: "),
      email: input("Email: "),
    );
    _website.addVisitor(visitor);
  }

  void addProduct() {
    print("\nAdding New Product");
    Product product = Product(name: input("Product Name: "));
    if (!_website.isProductExists(product.getName())) {
      product.setPrice(double.parse(input("Product Price: ")));
      product.setQuantity(int.parse(input("Product Stock: ")));
      product.setDiscount(double.parse(input("Product Discount: ")));
      _website.addProduct(product);
    } else {
      print("WARNING: Product(name=${product.getName()} Is Already Exists)");
    }
  }

  void addProductToVisitorCart() {
    print("\nAdding Product to Cart");
    String name = input("Visitor Name: ").trim().toLowerCase();
    Visitor? result = _website.getVisitor(name);

    if (result != null) {
      String name = input("Product Name: ").trim().toLowerCase();
      Product product = _website.getProductByName(name)!;
      if (!(product.getName() == "NAME")) {
        int quantity = int.parse(input("Product($name) Quantity: "));
        if (!(product.getQuantity() < quantity)) {
          result.addToCart(product);
          print("Product Added Successfully to Your Cart.");
        } else {
          print("WARNING: Not Enough Quantity, Only ${product.getQuantity()}");
        }
      } else {
        print("WARNING: Product(name=${name}) is Not Exists");
      }
    } else {
      print("WARNING: Visitor(name=$name) is Not Exists");
    }
  }

  void removeProduct() {
    print("\nRemoving Exists Product");
    _website.removeProduct(input("Product Name: "));
  }

  void searchByName() {
    print("\nSearching By Product Name");
    Product result = _website.getProductByName(input("Product Name: "))!;
    if (!(result.getName() == "NAME")) {
      print(result.toString());
    } else {
      print("Sorry, There is no any product with this name");
    }
  }

  void searchByPrice() {
    print("\nSearching By Product Price");
    bool status = false;
    double price = double.parse(input("Product Price: "));

    _website.getProducts().forEach((item) {
      if (item.getPrice() == price) {
        status = true;
        print(item.toString());
      }
    });
    print((!status
        ? "Sorry, There is No Any Product With This Price."
        : "Success!"));
  }

  void showWebsiteProducts() {
    print("\nShowing Website Products");
    _website.showProducts();
  }

  void showVisitorProducts() {
    print("\nShow Visitor Products");
    String visitorName = input("Visitor Name: ");
    Visitor? result = _website.getVisitor(visitorName);
    // print(result.)
    if (result != null) {
      if (result.getShoppingCart().getProducts().length > 0) {
        result.showCartProducts();
      } else {
        print("WARNING: Visitor Cart Is Empty");
      }
    } else {
      print("WARNING: Visitor(name=$visitorName) NOT EXISTS");
    }
  }

  void handleCommands() {
    clearCommands();
    this.addCommand(Command(title: "av", desc: "Add New Visitor"));
    this.addCommand(Command(title: "ap", desc: "Add New Product"));
    this.addCommand(Command(title: "avc", desc: "Add Product To Visitor Cart"));
    this.addCommand(Command(title: "rp", desc: "Remove Product"));
    this.addCommand(Command(title: "sbn", desc: "Search By Name"));
    this.addCommand(Command(title: "sbp", desc: "Search By Price"));
    this.addCommand(Command(
        title: "start", desc: "Restarting Application with hot reload."));
    this.addCommand(
        Command(title: "clear", desc: "Clear Application Window Terminal."));
    this.addCommand(
        Command(title: "exit", desc: "Close Application or shutdown it."));
  }

  @override
  void welcome() {
    print("Welcome to ${this.getName()}");
    print("Description: Website Shopping Application.");
  }
}
