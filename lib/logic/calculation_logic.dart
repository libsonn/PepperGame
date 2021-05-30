import 'dart:math';

import 'package:flutter/material.dart';

class CalculationLogic {
  double cash;
  int numberOfPeppers;
  double totalPrice;

  CalculationLogic({
    this.cash = 10.0,
    this.numberOfPeppers = 0,
    this.totalPrice = 0.0,
  });

  double getRandomPepperPrice() {
    double min = 1.5;
    double max = 2.5;
    return Random().nextDouble() * (max - min) + min;
  }

  void calculatePeppersValue({@required int quantity}) {
    totalPrice = getRandomPepperPrice() * quantity;
  }

  void buyPeppers({@required int quantity}) {
    cash -= totalPrice;
    numberOfPeppers += quantity;
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

  void payForBuying() {
    cash -= 0.2;
  }

  bool canBuyPeppers() {
    return cash >= totalPrice;
  }

  void resetCalculator() {
    cash = 10.0;
    numberOfPeppers = 0;
    totalPrice = 0.0;
  }
}
