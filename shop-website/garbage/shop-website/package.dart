import 'dart:io';

double calculateDiscount(
    {required double price,
    required int quantity,
    required double discountPercentage}) {
  double totalPrice = price * quantity;
  double discountAmount = totalPrice * (discountPercentage / 100);
  double discountedPrice = totalPrice - discountAmount;

  return discountedPrice / 100;
}

class Validation {
  bool validateEmail(String email) {
    return false;
  }

  bool validatePassword(String email) {
    return false;
  }
}

String input(final String label, {String pre = "", String post = ""}) {
  stdout.write(pre + label + post);
  return stdin.readLineSync()!;
}

void clear() {
  print("\x1B[2J\x1B[0;0H");
}

void exit() {
  print("Thanks! Application about to close.");
}

void write(String text, {final String pre = "", final String post = ""}) {
  stdout.write(pre + text + post);
}

/**Commas
 * every  1
 * 1,20,54,56
 * 
 * 10,203,456
 * 
 * 
 */
String commas(final int number, {final int every = 3}) {
  String result = "";
  String text = number.toString();
  final int commasCount = (text.length / every).ceil() - 1;

  // Start from the leftmost digit and add commas
  for (int x = 0; x <= commasCount * every; x += every) {
    // Extract the chunk of digits (every group of 'every' digits)
    String chunk = text.substring(x, x + every);

    // Append the chunk to the result
    result += chunk;

    // Add a comma if this is not the last chunk
    if (x + every < text.length) {
      result += ",";
    }
  }

  return result;
}

// void main() {
//   print(commas(123456789)); // Output: 123,456,789
//   print(commas(9876543210)); // Output: 9,876,543,210
// }

class BinaryTreeNode<T> {
  BinaryTreeNode(this.value, {this.leftChild, this.rightChild});

  T value;
  BinaryTreeNode<T>? leftChild;
  BinaryTreeNode<T>? rightChild;

  @override
  String toString() {
    final out = StringBuffer();

    final indents = <String>[];
    rightChild?._buildTree(out, true, indents);
    out.writeln(value);
    leftChild?._buildTree(out, false, indents);

    return out.toString();
  }

  void _buildTree(StringBuffer out, bool isRight, List<String> indents) {
    if (rightChild != null) {
      indents.add(isRight ? '     ' : '│    ');
      rightChild!._buildTree(out, true, indents);
      indents.removeLast();
    }

    out
      ..writeAll(indents)
      ..write(isRight ? '┌─── ' : '└─── ')
      ..writeln(value);

    if (leftChild != null) {
      indents.add(isRight ? '│    ' : '     ');
      leftChild!._buildTree(out, false, indents);
      indents.removeLast();
    }
  }
}
