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
  CalculationLogic calculationLogic;
  MerchantBloc({@required this.calculationLogic})
      : super(MerchantInitial(
            merchant: new Merchant(cash: 10.0, numberOfPeppers: 0)));

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
    double priceForOnePepper = calculationLogic.getRandomPepperPrice();
    double totalPrice = calculationLogic.calculatePeppersValue(
        priceForOnePepper: priceForOnePepper, quantity: event.quantity);

    if (calculationLogic.canBuyPeppers(
        price: totalPrice, budget: state.merchant.cash)) {
      merchant = state.merchant.copyWith(
        cash: state.merchant.cash - totalPrice,
        numberOfPeppers: state.merchant.numberOfPeppers + event.quantity,
        previousTotalPrice: totalPrice,
      );
      yield MerchantDidAction(merchant: merchant);
    } else {
      if (state.merchant.cash - 0.2 >
          state.merchant.numberOfPeppers * -2.00 + 1.5) {
        merchant = state.merchant.copyWith(
          cash: state.merchant.cash - 0.2,
          previousTotalPrice: totalPrice,
        );

        yield MerchantDidAction(merchant: merchant);
      } else {
        yield LostGame(merchant: merchant);
      }
    }
  }

  Stream<MerchantState> mapSellPeppersToState(
    SellPeppers event,
  ) async* {
    Merchant merchant;
    if (calculationLogic.canSellPeppers(
        quantityToSell: event.quantity,
        havePeppers: state.merchant.numberOfPeppers)) {
      merchant = state.merchant.copyWith(
          cash: state.merchant.cash + event.quantity * 2.0,
          numberOfPeppers: state.merchant.numberOfPeppers - event.quantity);
    } else {
      merchant = state.merchant.copyWith(
          cash: state.merchant.cash + state.merchant.numberOfPeppers * 2.0,
          numberOfPeppers: 0);
    }
    yield MerchantDidAction(merchant: merchant);
  }

  Stream<MerchantState> mapResetToState(
    Reset event,
  ) async* {
    yield MerchantInitial(
      merchant: new Merchant(cash: 10.0, numberOfPeppers: 0),
    );
  }
}
