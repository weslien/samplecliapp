import 'deck.dart';
import 'player.dart';

class Game {
  final List<Player> _players;
  final Deck _deck;
  final int _numberOfCardsToDealPerPlayer;

  Game._internal({
    required int numberOfPlayers,
    required int numberOfCardsToDealPerPlayer,
    required Deck deck,
  })  : _deck = deck,
        _numberOfCardsToDealPerPlayer = numberOfCardsToDealPerPlayer,
        _players =
            List.generate(numberOfPlayers, (i) => Player('Player ${i + 1}'));

  static Game initGame({
    required int numberOfPlayers,
    required int numberOfCardsToDealPerPlayer,
  }) {
    final deck = Deck.create();
    final neededCardsCount = numberOfPlayers * numberOfCardsToDealPerPlayer;
    if (neededCardsCount <= 0) {
      throw Exception(
          'Invalid number of players or cards to deal, both must be > 0');
    }
    if (neededCardsCount > deck.cardsCount) {
      throw Exception(
          'Invalid number of players or cards to deal, not enough cards in deck');
    }
    return Game._internal(
      deck: deck,
      numberOfCardsToDealPerPlayer: numberOfCardsToDealPerPlayer,
      numberOfPlayers: numberOfPlayers,
    );
  }

  void shuffleDeck() {
    _deck.shuffle();
  }

  void dealCards() {
    for (var player in _players) {
      for (var i = 0; i < _numberOfCardsToDealPerPlayer; i++) {
        player.addCardToBottom(_deck.takeTopCard());
      }
    }
  }

  /// This is the game logic
  /// This is a very basic game, it just calculate the score of each player
  /// and returns the winners list (can be more than 1 with the same score).
  List<Player> play() {
    var winners = [_players.first];
    for (var player in _players) {
      if (player.score > winners.first.score) {
        winners = [player];
      } else if (player.score == winners.first.score) {
        winners.add(player);
      }
    }
    return winners;
  }

  List<Player> get players => _players.toList();
}
