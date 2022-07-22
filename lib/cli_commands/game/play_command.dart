import 'package:dcli/dcli.dart';

import '../../cli_utils/logger.dart';
import '../../models/game.dart';
import '../base_command.dart';
import '../base_game_command.dart';
import '../general/quit_command.dart';
import '../general/start_game_command.dart';

class PlayCommand extends GameCommand {
  PlayCommand(Game game) : super('Play', game);

  @override
  void execute() {
    Logger.info(
        "The game simply calculates the score for each player and whoever has the highest score wins!");
    Logger.info("Playing...");

    final winners = game.play();
    if (winners.length > 1) {
      Logger.warn("It's a tie!");
      Logger.success(
          "Game over! The winners are: ${winners.map((player) => player.name).join(', ')} with the score of: ${winners.first.score}");
    } else {
      final winner = winners.first;
      Logger.success(
          'Game over! The winner is ${winner.name} with the score of: ${winner.score}');
    }

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

  @override
  AnsiColor get color => AnsiColor.green;
}
