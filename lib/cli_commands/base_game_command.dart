import '../models/game.dart';
import 'base_command.dart';

abstract class GameCommand extends Command {
  final Game game;

  GameCommand(String label, this.game) : super(label);
}
