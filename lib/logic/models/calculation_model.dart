class CalculationModel {
  final int numberOfPeppersToBuy;
  final int numberOfPeppersToSell;
  final double priceOnBuy;
  final double priceOnSell = 2.0;
  final double totalPrice;

  CalculationModel(
      {this.numberOfPeppersToBuy,
      this.numberOfPeppersToSell,
      this.priceOnBuy,
      this.totalPrice});

  CalculationModel copyWith(
      {int numberOfPeppersToBuy,
      int numberOfPeppersToSell,
      double priceOnBuy,
      double totalPrice}) {
    return CalculationModel(
      numberOfPeppersToBuy: numberOfPeppersToBuy ?? this.numberOfPeppersToBuy,
      numberOfPeppersToSell:
          numberOfPeppersToSell ?? this.numberOfPeppersToSell,
      priceOnBuy: priceOnBuy ?? this.priceOnBuy,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}
