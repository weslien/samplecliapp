enum Suit {
  clubs('Clubs', '♣'),
  diamonds('Diamonds', '♦'),
  hearts('Hearts', '♥'),
  spades('Spades', '♠');

  final String name;
  final String symbol;

  const Suit(this.name, this.symbol);

  @override
  String toString() {
    return "$name ($symbol)";
  }
}
