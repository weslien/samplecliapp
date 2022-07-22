import 'card.dart';

class Player {
  final String name;
  final List<Card> _cards = [];

  Player(this.name);

  void addCardToBottom(Card card) {
    _cards.insert(0, card);
  }

  List<Card> get cards => _cards.toList();

  int get score => _cards.fold(0, (sum, card) => sum + card.rank.power);
}
