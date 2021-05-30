import 'package:flutter/material.dart';
import 'package:pepper_game/logic/calculation_logic.dart';

class Merchant {
  final CalculationLogic calculationLogic;
  Merchant({
    @required this.calculationLogic,
  });

  Merchant copyWith({CalculationLogic calculationLogic}) {
    return Merchant(
      calculationLogic: calculationLogic ?? this.calculationLogic,
    );
  }
}
