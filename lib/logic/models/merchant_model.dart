class Merchant {
  double cash = 10.0;
  int numberOfPeppers = 0;

  Merchant({this.cash, this.numberOfPeppers});

  Merchant copyWith({double cash, int numberOfPeppers}) {
    return Merchant(
        cash: cash ?? this.cash,
        numberOfPeppers: numberOfPeppers ?? this.numberOfPeppers);
  }
}
