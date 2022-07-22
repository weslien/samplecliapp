import 'dart:async';

import 'package:dcli/dcli.dart';

abstract class Command {
  final String name;

  Command(this.name);

  AnsiColor get color => AnsiColor.yellow;
  String get coloredName => color.apply(name, background: AnsiColor.black);

  void execute();

  void executeInMicroTask() {
    scheduleMicrotask(execute);
  }
}
