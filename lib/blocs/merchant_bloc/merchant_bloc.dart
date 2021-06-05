import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pepper_game/logic/calculation_logic.dart';
import 'package:pepper_game/logic/models/merchant_model.dart';
import 'package:pepper_game/logic/models/purchase_model.dart';
import 'package:pepper_game/logic/models/sale_model.dart';
import 'package:pepper_game/logic/models/transaction_model.dart';

part 'merchant_event.dart';

part 'merchant_state.dart';

class MerchantBloc extends Bloc<MerchantEvent, MerchantState> {
  final CalculationLogic calculationLogic;

  MerchantBloc({@required this.calculationLogic}) : super(MerchantInitial());

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
    Purchase purchase = calculationLogic.buyPeppers(quantity: event.quantity);
    Merchant updatedMerchant = state.merchant.copyWith(
        budget: calculationLogic.cash,
        numberOfPeppers: calculationLogic.numberOfPeppers);
    if (purchase.isSuccessful) {
      yield MerchantDidAction(transaction: purchase, merchant: updatedMerchant);
    } else if (!purchase.isSuccessful) {
      if (calculationLogic.canStillPlay) {
        yield MerchantDidAction(
            transaction: purchase, merchant: updatedMerchant);
      } else if (!calculationLogic.canStillPlay) {
        calculationLogic.resetCalculator();
        yield LostGame();
      }
    }
  }

  Stream<MerchantState> mapSellPeppersToState(
    SellPeppers event,
  ) async* {
    Sale sale = calculationLogic.sellPeppers(quantity: event.quantity);
    Merchant updatedMerchant = state.merchant.copyWith(
        budget: calculationLogic.cash,
        numberOfPeppers: calculationLogic.numberOfPeppers);
    yield MerchantDidAction(transaction: sale, merchant: updatedMerchant);
  }

  Stream<MerchantState> mapResetToState(
    Reset event,
  ) async* {
    calculationLogic.resetCalculator();
    yield MerchantInitial();
  }
}
