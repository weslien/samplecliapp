import 'package:dcli/dcli.dart';
import 'package:samplecliapp/cli_commands/general/start_game_command.dart';

import '../../cli_utils/logger.dart';
import '../../models/game.dart';
import '../base_command.dart';
import '../base_game_command.dart';
import '../general/quit_command.dart';
import 'play_command.dart';
import 'show_each_player_cards_command.dart';

class DealCardsCommand extends GameCommand {
  DealCardsCommand(Game game) : super('Deal cards', game);

  @override
  void execute() {
    Logger.info('Dealing cards...');
    game.dealCards();
    Logger.info('Cards dealt!');

    final selected = menu<Command>(
      prompt: 'Select your action:',
      format: (command) => command.coloredName,
      options: [
        PlayCommand(game),
        ShowEachPlayerCardsCommand(game),
        StartGameCommand(),
        QuitCommand(),
      ],
    );
    selected.executeInMicroTask();
  }
}
