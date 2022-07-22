import 'package:dcli/dcli.dart';
import 'package:samplecliapp/cli_utils/logger.dart';

import '../../models/game.dart';
import '../base_command.dart';
import '../game/deal_cards_command.dart';
import '../game/shuffle_deck_command.dart';
import 'quit_command.dart';

class StartGameCommand extends Command {
  StartGameCommand() : super('Start a new game');

  @override
  void execute() {
    Logger.info("Setup a new game");
    final numberOfPlayersInput = ask(green('Number of players:', background: AnsiColor.black),
        validator: Ask.all(
          [
            Ask.integer,
            Ask.valueRange(2, 52),
          ],
        ));
    final numberOfPlayers = int.tryParse(numberOfPlayersInput);

    Logger.info("Setup a new game");

    final numberOfCardsToDealPerPlayerInput =
        ask(green('How many cards to deal per player?', background: AnsiColor.black),
            validator: Ask.all(
              [
                Ask.integer,
                Ask.valueRange(1, (52 / numberOfPlayers!).floor()),
              ],
            ));
    final numberOfCardsToDealPerPlayer = int.tryParse(numberOfCardsToDealPerPlayerInput);

    final game = Game.initGame(
      numberOfPlayers: numberOfPlayers,
      numberOfCardsToDealPerPlayer: numberOfCardsToDealPerPlayer!,
    );

    final selected = menu<Command>(
      prompt: 'Game setup complete, select your action:',
      format: (command) => command.coloredName,
      options: [
        ShuffleTheDeckCommand(game),
        DealCardsCommand(game),
        QuitCommand(),
      ],
    );
    selected.executeInMicroTask();
  }

  @override
  AnsiColor get color => AnsiColor.green;
}
