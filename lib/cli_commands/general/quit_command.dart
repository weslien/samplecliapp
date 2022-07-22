import 'dart:io';

import 'package:dcli/dcli.dart';

import '../base_command.dart';

class QuitCommand extends Command {
  QuitCommand() : super('Quit');

  @override
  void execute() {
    if (confirm(red("Are you sure you want to quit? (y/n):",
        background: AnsiColor.black))) {
      exit(0);
    }
  }

  @override
  AnsiColor get color => AnsiColor.red;
}
