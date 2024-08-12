import 'dart:io';

class Command {
  late String _title, _desc;

  // Constructor
  Command({final String title = "", final String desc = ""}) {
    this.setTitle(title);
    this.setDescription(desc);
  }

  // Setters
  void setTitle(final String title) {
    this._title = title;
  }

  void setDescription(final String desc) {
    this._desc = desc;
  }

  // Getters
  String getTitle() {
    return this._title.trim().toLowerCase();
  }

  String getDescription() {
    return this._desc.trim();
  }


  
  // Abstract
  @override
  String toString() {
    return "${this.getTitle()}".padRight(5) +
        "   " +
        "${this.getDescription()}".padLeft(5);
  }
}

abstract class App {
  late bool _running = true;
  late String _prompt, _input = "", _name, _desc, _usage;
  late List<Command> _commands = [
    Command(title: "start", desc: "Restarting Application with hot reload."),
    Command(title: "clear", desc: "Clear Application Window Terminal."),
    Command(title: "exit", desc: "Close Application or shutdown it."),
  ];

  // Constructor
  App(
    final String name, {
    final String prompt = "Application> ",
    final String desc = "A Command-Line Tool for Terminal Apps.",
    final String usage = "start|clear|exit",
  }) {
    this.setName(name);
    this.setDesc(desc);
    this.setPrompt(prompt);
    this.setUsage(usage);
  }

  // Setters
  void setPrompt(final String prompt) {
    this._prompt = prompt;
  }

  void setInput(final String input) {
    this._input = input;
  }

  void setName(final String name) {
    this._name = name;
  }

  void setRunning(final bool running) {
    this._running = running;
  }

  void setDesc(final String desc) {
    this._desc = desc;
  }

  void setUsage(final String usage) {
    this._usage = usage;
  }

  // Getters
  String getPrompt() {
    return this._prompt;
  }

  String getName() {
    return this._name;
  }

  String getInput() {
    return this._input;
  }

  bool getRunning() {
    return this._running;
  }

  String getDesc() {
    return this._desc;
  }

  String getUsage() {
    return this._usage;
  }

  // CRUD
  void addCommand(final Command command) {
    if (!this._commands.any((element) => element == command)) {
      this._commands.add(command);
    }
  }

  void removeCommand(final Command command) {
    if (this._commands.any((element) => element == command)) {
      this._commands.removeWhere((element) => element == command);
    }
  }

  // Functionalities
  String input(final String label,
      {final String pre = "", final String post = ""}) {
    stdout.write("${pre}${label}${post}");
    return stdin.readLineSync()!;
  }

  void clearCommands() {
    this._commands.clear();
  }

  // Methods
  void run() {
    clear();
    welcome();
    menu();
    while (this.getRunning()) {
      this._input = input("Choose(Start/Clear/Exit): ").trim().toLowerCase();

      switch (this._input) {
        case "start" || "st" || "s":
          this.run();
          break;
        case "clear" || "cls" || "c":
          this.clear();
          break;
        case "exit" || "ex" || "x":
          this.exit();
          break;
      }
    }
  }

  void exit() {
    this.setRunning(false);
    print("${getName()} is about to close.");
  }

  void clear() {
    print("\x1B[2J\x1B[0;0H");
  }

  void menu() {
    print(this.getDesc() + "\n");
    print("Usage: ${this.getUsage()}\n");
    print("Available commands: ");
    _commands.forEach((command) {
      print("    ${command.toString()}");
    });
    print("");

  }

  // Abstract
  void welcome();
  String toString();
}
