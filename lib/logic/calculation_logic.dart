import 'package:flutter/material.dart';
import 'package:pepper_game/logic/models/purchase_model.dart';
import 'package:pepper_game/logic/models/sale_model.dart';
import 'package:pepper_game/logic/pepper_price_generator.dart';

class CalculationLogic {
  final PepperPriceGenerator generator;

  double cash;
  int numberOfPeppers;

  CalculationLogic({
    this.generator,
    this.cash = 10.0,
    this.numberOfPeppers = 0,
  });

  Purchase buyPeppers({@required int quantity}) {
    Purchase purchase;
    double pepperPrice = _getRandomPepperPrice();
    double totalPrice =
        getTotalCost(quantity: quantity, pepperPrice: pepperPrice);
    if (totalPrice <= cash) {
      purchase = PurchaseSuccessful(
        pepperPrice: pepperPrice,
        quantity: quantity,
      );
    } else if (totalPrice > cash) {
      purchase = PurchaseUnsuccessful(
        pepperPrice: pepperPrice,
        quantity: quantity,
      );
    }
    numberOfPeppers += purchase.quantityBought;
    cash -= purchase.toPay;
    return purchase;
  }

  Sale sellPeppers({@required int quantity}) {
    Sale sale;
    if (numberOfPeppers == 0) {
      return SaleUnsuccessful();
    }

    if (quantity <= numberOfPeppers) {
      sale = SaleSuccessful(quantity: quantity);
    } else {
      sale = SaleSuccessful(quantity: numberOfPeppers);
    }
    numberOfPeppers -= sale.quantitySold;
    cash += sale.totalIncome;

    return sale;
  }

  void resetCalculator() {
    cash = 10.0;
    numberOfPeppers = 0;
  }

  bool get canStillPlay => cash > numberOfPeppers * -2.00 + 1.5;

  double _getRandomPepperPrice() => generator.generatePrice();

  double getTotalCost({int quantity, double pepperPrice}) {
    return quantity * pepperPrice + 0.2;
  }
}
