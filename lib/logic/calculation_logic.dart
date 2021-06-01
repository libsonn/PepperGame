import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pepper_game/logic/models/purchase_model.dart';

class CalculationLogic {
  Purchase purchase;
  double cash;
  int numberOfPeppers;

  CalculationLogic({
    this.cash = 10.0,
    this.numberOfPeppers = 0,
  });

  double getRandomPepperPrice() {
    double min = 1.5;
    double max = 2.5;
    return Random().nextDouble() * (max - min) + min;
  }

  double getTotalCost({int quantity, double pepperPrice}) {
    return quantity * pepperPrice + 0.2;
  }

  void buyPeppers({@required int quantity}) {
    double pepperPrice = getRandomPepperPrice();
    double totalPrice =
        getTotalCost(quantity: quantity, pepperPrice: pepperPrice);
    if (totalPrice <= cash) {
      purchase = PurchaseSuccesful(
        pepperPrice: pepperPrice,
        quantity: quantity,
      );
    } else if (totalPrice > cash) {
      purchase = PurchaseUnsuccesful(
        pepperPrice: pepperPrice,
        quantity: quantity,
      );
    }
    numberOfPeppers += purchase.quantityBought;
    cash -= purchase.toPay;
  }

  void sellPeppers({@required int quantity}) {
    if (quantity <= numberOfPeppers) {
      numberOfPeppers -= quantity;
      cash += quantity * 2.0;
    } else {
      cash += numberOfPeppers * 2.0;
      numberOfPeppers = 0;
    }
  }

  void resetCalculator() {
    cash = 10.0;
    numberOfPeppers = 0;
  }
}
