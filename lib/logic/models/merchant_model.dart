class Merchant {
  final double budget;
  final int numberOfPeppers;

  Merchant({this.budget, this.numberOfPeppers});

  Merchant copyWith({double budget, int numberOfPeppers}) {
    return Merchant(
      budget: budget ?? this.budget,
      numberOfPeppers: numberOfPeppers ?? this.numberOfPeppers,
    );
  }
}
