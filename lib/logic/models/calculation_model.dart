class CalculationModel {
  final int numberOfPeppersToBuy;
  final int numberOfPeppersToSell;
  final double priceOnSell = 2.0;

  CalculationModel({this.numberOfPeppersToBuy, this.numberOfPeppersToSell});

  CalculationModel copyWith(
      {int numberOfPeppersToBuy,
      int numberOfPeppersToSell,
      double priceOnBuy,
      double totalPrice}) {
    return CalculationModel(
      numberOfPeppersToBuy: numberOfPeppersToBuy ?? this.numberOfPeppersToBuy,
      numberOfPeppersToSell:
          numberOfPeppersToSell ?? this.numberOfPeppersToSell,
    );
  }
}
