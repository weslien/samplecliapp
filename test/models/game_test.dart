import 'package:samplecliapp/models/game.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('Game test', () {
    test('Should throw exception when too many players', () {
      expect(
        () => Game.initGame(
          numberOfCardsToDealPerPlayer: 1,
          numberOfPlayers: 100,
        ),
        throwsException,
      );
    });

    test('Should throw exception when too many cards to deal per player', () {
      expect(
        () => Game.initGame(
          numberOfCardsToDealPerPlayer: 100,
          numberOfPlayers: 2,
        ),
        throwsException,
      );
    });

    test('Should throw exception when players or cards to deal are lower than 1', () {
      expect(
        () => Game.initGame(
          numberOfCardsToDealPerPlayer: 0,
          numberOfPlayers: 2,
        ),
        throwsException,
      );

      expect(
        () => Game.initGame(
          numberOfCardsToDealPerPlayer: 2,
          numberOfPlayers: 0,
        ),
        throwsException,
      );
    });

    test('Should setup number of players properly', () {
      final game = Game.initGame(
        numberOfCardsToDealPerPlayer: 2,
        numberOfPlayers: 8,
      );
      expect(game.players.length, 8);
    });

    test('Should deal cards to players properly', () {
      final numberOfCardsToDealPerPlayer = 2;
      final game = Game.initGame(
        numberOfCardsToDealPerPlayer: numberOfCardsToDealPerPlayer,
        numberOfPlayers: 8,
      );
      expect(game.players.every((player) => player.cards.isEmpty), true);
      game.dealCards();
      expect(
        game.players.every((player) => player.cards.length == numberOfCardsToDealPerPlayer),
        true,
      );
    });
  });
}
