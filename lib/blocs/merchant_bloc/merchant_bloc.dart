import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pepper_game/logic/calculation_logic.dart';
import 'package:pepper_game/logic/models/merchant_model.dart';

part 'merchant_event.dart';
part 'merchant_state.dart';

class MerchantBloc extends Bloc<MerchantEvent, MerchantState> {
  final CalculationLogic calculationLogic;
  MerchantBloc({@required this.calculationLogic})
      : super(
          MerchantInitial(
            merchant: new Merchant(
              calculationLogic: calculationLogic,
            ),
          ),
        );

  @override
  Stream<MerchantState> mapEventToState(
    MerchantEvent event,
  ) async* {
    if (event is BuyPeppers) {
      yield* mapBuyPeppersToState(event);
    }
    if (event is SellPeppers) {
      yield* mapSellPeppersToState(event);
    }
    if (event is Reset) {
      yield* mapResetToState(event);
    }
  }

  Stream<MerchantState> mapBuyPeppersToState(
    BuyPeppers event,
  ) async* {
    Merchant merchant;
    calculationLogic.buyPeppers(quantity: event.quantity);

    if (calculationLogic.purchase.isSuccessful) {
      merchant = state.merchant.copyWith(calculationLogic: calculationLogic);

      yield MerchantDidAction(merchant: merchant);
    } else {
      if (state.merchant.calculationLogic.cash >
          state.merchant.calculationLogic.numberOfPeppers * -2.00 + 1.5) {
        merchant = state.merchant.copyWith(
          calculationLogic: calculationLogic,
        );

        yield MerchantDidAction(merchant: merchant);
      } else {
        calculationLogic.resetCalculator();
        yield LostGame(
          merchant: Merchant(
            calculationLogic: CalculationLogic(),
          ),
        );
      }
    }
  }

  Stream<MerchantState> mapSellPeppersToState(
    SellPeppers event,
  ) async* {
    Merchant merchant;
    calculationLogic.sellPeppers(quantity: event.quantity);
    merchant = state.merchant.copyWith(calculationLogic: calculationLogic);
    yield MerchantDidAction(merchant: merchant);
  }

  Stream<MerchantState> mapResetToState(
    Reset event,
  ) async* {
    calculationLogic.resetCalculator();
    yield MerchantInitial(
      merchant: new Merchant(
        calculationLogic: new CalculationLogic(),
      ),
    );
  }
}
