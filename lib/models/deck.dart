import 'card.dart';
import 'rank.dart';
import 'suit.dart';

class Deck {
  final List<Card> _cards;

  Deck._internal() : _cards = _createCards();

  int get cardsCount => _cards.length;

  /// Returns a new [Deck] of cards.
  /// The deck is shuffled.
  static Deck create() {
    var deck = Deck._internal();
    deck.shuffle();
    return deck;
  }

  void shuffle() {
    _cards.shuffle();
  }

  static List<Card> _createCards() {
    var cards = <Card>[];
    for (var suit in Suit.values) {
      for (var rank in Rank.values) {
        cards.add(Card(rank, suit));
      }
    }
    return cards;
  }

  Card takeTopCard() {
    if (_cards.isEmpty) {
      throw Exception('Deck is empty');
    }
    return _cards.removeLast();
  }
}
