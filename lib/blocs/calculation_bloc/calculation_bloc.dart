import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pepper_game/logic/calculation_logic.dart';
import 'package:pepper_game/logic/models/calculation_model.dart';

part 'calculation_event.dart';
part 'calculation_state.dart';

class CalculationBloc extends Bloc<CalculationEvent, CalculationState> {
  CalculationLogic calculationLogic;
  CalculationBloc({@required this.calculationLogic})
      : super(
          CalculationInitial(
            calculationModel: new CalculationModel(
                numberOfPeppersToBuy: 12,
                numberOfPeppersToSell: 1,
                priceOnBuy: 0.0),
          ),
        );

  @override
  Stream<CalculationState> mapEventToState(
    CalculationEvent event,
  ) async* {
    if (event is ChangedNumbersOfPeppersToBuy) {
      yield* mapChangedNumberOfPeppersToBuyToState(event);
    }
    if (event is ChangedNumbersOfPeppersToSell) {
      yield* mapChangedNumberOfPeppersToSellToState(event);
    }
    if (event is CalculateValueToBuyPeppers) {
      yield* mapCalculateValueToBuyPeppersToState(event);
    }
    if (event is CalculateValueToSellPeppers) {
      yield* mapCalculateValueToSellPeppersToState(event);
    }
  }

  Stream<CalculationState> mapChangedNumberOfPeppersToBuyToState(
    ChangedNumbersOfPeppersToBuy event,
  ) async* {
    CalculationModel newCalculationModel;

    newCalculationModel = state.calculationModel
        .copyWith(numberOfPeppersToBuy: event.numberOfPeppersToBuy);

    yield CalculationChanged(calculationModel: newCalculationModel);
  }

  Stream<CalculationState> mapChangedNumberOfPeppersToSellToState(
    ChangedNumbersOfPeppersToSell event,
  ) async* {
    CalculationModel newCalculationModel;

    newCalculationModel = state.calculationModel
        .copyWith(numberOfPeppersToSell: event.numberOfPeppersToSell);

    yield CalculationChanged(calculationModel: newCalculationModel);
  }

  Stream<CalculationState> mapCalculateValueToBuyPeppersToState(
    CalculateValueToBuyPeppers event,
  ) async* {
    CalculationModel newCalculationModel;

    double randomPepperPrice = calculationLogic.getRandomPepperPrice();

    newCalculationModel =
        state.calculationModel.copyWith(priceOnBuy: randomPepperPrice);

    yield CalculationChanged(calculationModel: newCalculationModel);
  }

  Stream<CalculationState> mapCalculateValueToSellPeppersToState(
    CalculateValueToSellPeppers event,
  ) async* {}
}