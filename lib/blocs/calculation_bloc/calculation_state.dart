part of 'calculation_bloc.dart';

abstract class CalculationState extends Equatable {
  final CalculationModel calculationModel;

  const CalculationState({@required this.calculationModel});

  @override
  List<Object> get props => [calculationModel];
}

class CalculationInitial extends CalculationState {
  final CalculationModel calculationModel;
  CalculationInitial({@required this.calculationModel});

  @override
  List<Object> get props => [calculationModel];
}

class CalculationChanged extends CalculationState {
  final CalculationModel calculationModel;
  CalculationChanged({@required this.calculationModel});
}
