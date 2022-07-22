import 'package:dcli/dcli.dart';

import '../base_command.dart';
import 'quit_command.dart';
import 'start_game_command.dart';

class StartCliCommand extends Command {
  StartCliCommand() : super('Welcome to the game!');

  @override
  void execute() {
    final selected = menu<Command>(
      prompt: 'Select your action:',
      format: (command) => command.coloredName,
      options: [
        StartGameCommand(),
        QuitCommand(),
      ],
    );
    selected.executeInMicroTask();
  }
}
