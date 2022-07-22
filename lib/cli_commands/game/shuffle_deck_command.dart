import 'package:dcli/dcli.dart';
import 'package:samplecliapp/cli_utils/logger.dart';

import '../../models/game.dart';
import '../base_command.dart';
import '../base_game_command.dart';
import '../general/quit_command.dart';
import 'deal_cards_command.dart';

class ShuffleTheDeckCommand extends GameCommand {
  ShuffleTheDeckCommand(Game game) : super('Shuffle the deck', game);

  @override
  void execute() {
    Logger.info("Shuffling the deck...");
    game.shuffleDeck();
    Logger.info("Deck shuffled!");

    final selected = menu<Command>(
      prompt: 'Select your action:',
      format: (command) => command.coloredName,
      options: [
        ShuffleTheDeckCommand(game),
        DealCardsCommand(game),
        QuitCommand(),
      ],
    );
    selected.executeInMicroTask();
  }
}
