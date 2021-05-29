class Merchant {
  final double cash;
  final int numberOfPeppers;
  final double previousTotalPrice;
  Merchant({
    this.cash = 10,
    this.numberOfPeppers = 0,
    this.previousTotalPrice = 0.0,
  });

  Merchant copyWith(
      {double cash, int numberOfPeppers, double previousTotalPrice}) {
    return Merchant(
      cash: cash ?? this.cash,
      numberOfPeppers: numberOfPeppers ?? this.numberOfPeppers,
      previousTotalPrice: previousTotalPrice ?? this.previousTotalPrice,
    );
  }
}
