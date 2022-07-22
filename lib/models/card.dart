import 'rank.dart';
import 'suit.dart';

class Card {
  final Rank rank;
  final Suit suit;

  const Card(this.rank, this.suit);

  @override
  String toString() {
    return "$rank of $suit";
  }
}
