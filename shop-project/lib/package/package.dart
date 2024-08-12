import 'dart:io';

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
