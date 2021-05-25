part of 'calculation_bloc.dart';

abstract class CalculationEvent extends Equatable {
  const CalculationEvent();

  @override
  List<Object> get props => [];
}

class ChangedNumbersOfPeppersToBuy extends CalculationEvent {
  final int numberOfPeppersToBuy;
  ChangedNumbersOfPeppersToBuy({@required this.numberOfPeppersToBuy});
}

class ChangedNumbersOfPeppersToSell extends CalculationEvent {
  final int numberOfPeppersToSell;
  ChangedNumbersOfPeppersToSell({@required this.numberOfPeppersToSell});
}

class CalculateValueToBuyPeppers extends CalculationEvent {
  CalculateValueToBuyPeppers();
}

class CalculateValueToSellPeppers extends CalculationEvent {
  CalculateValueToSellPeppers();
}
