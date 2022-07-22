import 'package:dcli/dcli.dart';

import '../../cli_utils/logger.dart';
import '../../models/game.dart';
import '../base_command.dart';
import '../base_game_command.dart';
import '../general/quit_command.dart';
import 'play_command.dart';

class ShowEachPlayerCardsCommand extends GameCommand {
  ShowEachPlayerCardsCommand(Game game)
      : super("Show each player's cards", game);

  @override
  void execute() {
    Logger.info("Showing each player's cards...");
    for (var player in game.players) {
      Logger.info("${player.name}'s cards: ${player.cards.join(', ')}");
    }

    final selected = menu<Command>(
      prompt: 'Select your action:',
      format: (command) => command.coloredName,
      options: [
        PlayCommand(game),
        ShowEachPlayerCardsCommand(game),
        QuitCommand(),
      ],
    );
    selected.executeInMicroTask();
  }
}
