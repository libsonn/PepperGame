class CalculationModel {
  final int numberOfPeppersToBuy;
  final int numberOfPeppersToSell;

  CalculationModel({this.numberOfPeppersToBuy, this.numberOfPeppersToSell});

  CalculationModel copyWith({
    int numberOfPeppersToBuy,
    int numberOfPeppersToSell,
  }) {
    return CalculationModel(
      numberOfPeppersToBuy: numberOfPeppersToBuy ?? this.numberOfPeppersToBuy,
      numberOfPeppersToSell:
          numberOfPeppersToSell ?? this.numberOfPeppersToSell,
    );
  }
}
